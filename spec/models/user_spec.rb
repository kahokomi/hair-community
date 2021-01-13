# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  subject { user.valid? }

  let!(:user) { build(:user) }
  let!(:hairdresser) { build(:hairdresser) }

  it '全ての項目に正常な値が設定されていれば保存されるか' do
    expect(user).to be_valid
    expect(hairdresser).to be_valid
  end

  describe '新規登録時バリデーションのチェック' do
    context '空欄かどうか' do
      it 'usernameに対してエラーメッセージが返ってくるか' do
        user.username = ''
        is_expected.to eq false
        expect(user.errors[:username]).to include("を入力してください")
      end

      it 'emailに対してエラーメッセージが返ってくるか' do
        user.email = ''
        is_expected.to eq false
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'passwordに対してエラーメッセージが返ってくるか' do
        user.password = ''
        is_expected.to eq false
        expect(user.errors[:password]).to include("を入力してください")
      end
    end

    context '一意でない場合' do
      it 'usernameに対してエラーメッセージが返ってくるか' do
        hairdresser.username = 'Hogehoge1'
        hairdresser.save
        user.username = hairdresser.username
        user.save
        is_expected.to eq false
        expect(user.errors[:username]).to include("はすでに存在します")
      end

      it 'emailに対してエラーメッセージが返ってくるか' do
        hairdresser.email = 'hoge@hoge'
        hairdresser.save
        user.email = hairdresser.email
        user.save
        is_expected.to eq false
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end

    context '必要字数を満たしているか' do
      it 'passwordが6文字以下の場合エラーメッセージが返ってくるか' do
        user.password = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it 'usernameが6文字以下の場合エラーメッセージが返ってくるか' do
        user.username = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
        expect(user.errors[:username]).to include("は6文字以上で入力してください")
      end

      it 'usernameが20文字以上の場合エラーメッセージが返ってくるか' do
        user.username = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
        expect(user.errors[:username]).to include("は20文字以内で入力してください")
      end
    end

    context '半角英数で入力されているか' do
      it 'usernameが半角英数のみでない場合エラーメッセージが返ってくるか' do
        user.username = 'hoge-hoge'
        is_expected.to eq false
        expect(user.errors[:username]).to include("は不正な値です")
      end
      it 'passwordが半角英数のみでない場合エラーメッセージが返ってくるか' do
        user.password = 'hoge-hoge'
        is_expected.to eq false
        expect(user.errors[:password]).to include("は不正な値です")
      end
    end
  end

  describe 'プロフィール更新時バリデーションのチェック' do
    let!(:user) { create(:user) }
    let!(:hairdresser) { create(:hairdresser) }

    context '空欄かどうか' do
      context 'usernameが空の場合' do
        subject { user.errors[:username] }

        let(:username) { '' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end

      context 'nameが空の場合' do
        subject { user.errors[:name] }

        let(:name) { '' }

        before { user.update(name: name) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end

      context 'yearが空の場合' do
        subject { hairdresser.errors[:year] }

        let(:year) { nil }

        before { hairdresser.update(year: year) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context '一般ユーザ 数値が正しく入力されているか' do
      subject { user.errors[:age] }

      let(:age) { 1 }

      before { user.update(age: age) }

      context 'ageの数値が0以下になっている場合' do
        let(:age) { 0 }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は1以上の値にしてください")
        end
      end

      context 'ageの数値が100以上担っている場合' do
        let(:age) { 101 }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は100以下の値にしてください")
        end
      end
    end

    context '美容師 数値が正しく入力されているか' do
      subject { hairdresser.errors[:year] }

      let(:year) { 1 }

      before { hairdresser.update(year: year) }

      context 'yearの数値が0以下になっている場合' do
        let(:year) { 0 }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は1以上の値にしてください")
        end
      end

      context 'yearの数値が0以下になっている場合' do
        let(:year) { 101 }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は100以下の値にしてください")
        end
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Tweetモデルとの関係' do
      let(:target) { :tweets }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Likeモデルとの関係' do
      let(:target) { :likes }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'UserRoomモデルとの関係' do
      let(:target) { :user_rooms }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      let(:target) { :chats }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Relationshipモデル(active_relationships)との関係' do
      let(:target) { :active_relationships }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはRelationshipか' do
        expect(association.class_name).to eq 'Relationship'
      end
    end

    context 'Relationshipモデル(passive_relationships)との関係' do
      let(:target) { :passive_relationships }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはRelationshipか' do
        expect(association.class_name).to eq 'Relationship'
      end
    end

    context '自分がフォローしているユーザーとの関連（自己結合型多対多）' do
      let(:target) { :followings }

      it '1:Nとなっているか（中間テーブルactive_relationshipsを介す）' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(Follower)か' do
        expect(association.class_name).to eq 'User'
      end
    end

    context '自分がフォローされるユーザーとの関連（自己結合型多対多）' do
      let(:target) { :followers }

      it '1:Nとなっているか(中間テーブルpassive_relationshipsを介す）' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(Following)か' do
        expect(association.class_name).to eq 'User'
      end
    end
  end
end
