# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe User, "モデルに関するテスト", type: :model do
  subject { user.valid? }

  let!(:user) { build(:user) }
  let!(:hairdresser) { build(:hairdresser) }

  it '全ての項目に正常な値が設定されていれば保存されるか' do
    expect(user).to be_valid
    expect(hairdresser).to be_valid
  end

  describe '新規登録時バリデーションのチェック' do
    context 'usernameのテスト' do
      it '空欄の場合エラーメッセージが返ってくるか' do
        user.username = ''
        is_expected.to eq false
        expect(user.errors[:username]).to include("を入力してください")
      end

      it '一意でない場合エラーメッセージが返ってくるか' do
        hairdresser.username = 'Hogehoge1'
        hairdresser.save
        user.username = hairdresser.username
        user.save
        is_expected.to eq false
        expect(user.errors[:username]).to include("はすでに存在します")
      end

      it '6文字以下の場合エラーメッセージが返ってくるか' do
        user.username = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
        expect(user.errors[:username]).to include("は6文字以上で入力してください")
      end

      it '20文字以上の場合エラーメッセージが返ってくるか' do
        user.username = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
        expect(user.errors[:username]).to include("は20文字以内で入力してください")
      end

      it '半角英数以外が含まれている場合エラーメッセージが返ってくるか' do
        user.username = 'Hoge-hoge1'
        is_expected.to eq false
        expect(user.errors[:username]).to include("は不正な値です")
      end

      it '数字が含まれていない場合エラーメッセージが返ってくるか' do
        user.username = 'Hogehoge'
        is_expected.to eq false
        expect(user.errors[:username]).to include("は不正な値です")
      end

      it '英大文字が含まれていない場合エラーメッセージが返ってくるか' do
        user.username = 'hogehog1'
        is_expected.to eq false
        expect(user.errors[:username]).to include("は不正な値です")
      end

      it '英小文字が含まれていない場合エラーメッセージが返ってくるか' do
        user.username = 'HOGEHOGE1'
        is_expected.to eq false
        expect(user.errors[:username]).to include("は不正な値です")
      end
    end

    context 'emailのテスト' do
      it '空欄の場合エラーメッセージが返ってくるか' do
        user.email = ''
        is_expected.to eq false
        expect(user.errors[:email]).to include("を入力してください")
      end

      it '一意でない場合エラーメッセージが返ってくるか' do
        hairdresser.email = 'hoge@hoge'
        hairdresser.save
        user.email = hairdresser.email
        user.save
        is_expected.to eq false
        expect(user.errors[:email]).to include("はすでに存在します")
      end

      it 'アットマークが含まれているか' do
        user.email = 'hogehoge'
        user.save
        is_expected.to eq false
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end

    context 'passwordに関するテスト' do
      it '空欄の場合エラーメッセージが返ってくるか' do
        user.password = ''
        is_expected.to eq false
        expect(user.errors[:password]).to include("を入力してください")
      end

      it '6文字以下の場合エラーメッセージが返ってくるか' do
        user.password = Faker::Lorem.characters(number: 5)
        is_expected.to eq false
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it '128文字以上の場合エラーメッセージが返ってくるか' do
        user.password = Faker::Lorem.characters(number: 129)
        is_expected.to eq false
        expect(user.errors[:password]).to include("は128文字以内で入力してください")
      end

      it '半角英数のみでない場合エラーメッセージが返ってくるか' do
        user.password = 'Hoge-hoge1'
        is_expected.to eq false
        expect(user.errors[:password]).to include("は不正な値です")
      end

      it '数字が含まれていない場合エラーメッセージが返ってくるか' do
        user.password = 'Hogehoge'
        is_expected.to eq false
        expect(user.errors[:password]).to include("は不正な値です")
      end

      it '英大文字が含まれていない場合エラーメッセージが返ってくるか' do
        user.password = 'hogehoge1'
        is_expected.to eq false
        expect(user.errors[:password]).to include("は不正な値です")
      end

      it '英小文字が含まれていない場合エラーメッセージが返ってくるか' do
        user.password = 'HOGEHOGE1'
        is_expected.to eq false
        expect(user.errors[:password]).to include("は不正な値です")
      end
    end
  end

  describe 'プロフィール更新時バリデーションのチェック' do
    let!(:user) { create(:user) }
    let!(:hairdresser) { create(:hairdresser) }

    context 'usernameに関するテスト' do
      subject { user.errors[:username] }

      context '空の場合' do
        let(:username) { '' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end

      context '一意でない場合' do
        let(:username) { 'Testuser2' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("はすでに存在します")
        end
      end

      context '6文字以下の場合' do
        let(:username) { Faker::Lorem.characters(number: 5) }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は6文字以上で入力してください")
        end
      end

      context '20文字以上の場合' do
        let(:username) { Faker::Lorem.characters(number: 21) }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は20文字以内で入力してください")
        end
      end

      context '半角英数以外が含まれている場合' do
        let(:username) { 'Hoge-hoge1' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は不正な値です")
        end
      end

      context '数字が含まれていない場合か' do
        let(:username) { 'Hogehoge' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は不正な値です")
        end
      end

      context '英大文字が含まれていない場合エラーメッセージが返ってくるか' do
        let(:username) { 'hogehoge1' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は不正な値です")
        end
      end

      context '英小文字が含まれていない場合エラーメッセージが返ってくるか' do
        let(:username) { 'HOGEHOGE1' }

        before { user.update(username: username) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は不正な値です")
        end
      end
    end

    context 'nameのテスト' do
      subject { user.errors[:name] }

      context '空欄の場合' do
        let(:name) { '' }

        before { user.update(name: name) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'yearのテスト' do
      subject { hairdresser.errors[:year] }

      context '空の場合' do
        let(:year) { nil }

        before { hairdresser.update(year: year) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end

      context '数値が0以下の場合' do
        let(:year) { 0 }

        before { hairdresser.update(year: year) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は1以上の値にしてください")
        end
      end

      context '数値が101以上の場合' do
        let(:year) { 101 }

        before { hairdresser.update(year: year) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は100以下の値にしてください")
        end
      end

      context '数値に文字列が含まれている場合' do
        let(:year) { "year" }

        before { hairdresser.update(year: year) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は数値で入力してください")
        end
      end
    end

    context 'positionに関するテスト' do
      subject { hairdresser.errors[:position] }

      context '空欄の場合' do
        let(:position) { '' }

        before { hairdresser.update(position: position) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'hair_salonに関するテスト' do
      subject { hairdresser.errors[:hair_salon] }

      context '空欄の場合' do
        let(:hair_salon) { '' }

        before { hairdresser.update(hair_salon: hair_salon) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'jobに関するテスト' do
      subject { user.errors[:job] }

      context '空欄の場合' do
        let(:job) { '' }

        before { user.update(job: job) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'ageに関するテスト' do
      subject { user.errors[:age] }

      context '数値が0以下の場合' do
        let(:age) { 0 }

        before { user.update(age: age) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は1以上の値にしてください")
        end
      end

      context '数値が101以上の場合' do
        let(:age) { 101 }

        before { user.update(age: age) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は100以下の値にしてください")
        end
      end

      context '数値に文字列が含まれている場合' do
        let(:age) { "age" }

        before { user.update(age: age) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は数値で入力してください")
        end
      end
    end

    context 'priceに関するテスト' do
      subject { hairdresser.errors[:price] }

      context '数値が0以下の場合' do
        let(:price) { 0 }

        before { hairdresser.update(price: price) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は1以上の値にしてください")
        end
      end

      context '数値に文字列が含まれている場合' do
        let(:price) { "price" }

        before { hairdresser.update(price: price) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("は数値で入力してください")
        end
      end
    end

    context 'prefectureに関するテスト' do
      subject { hairdresser.errors[:prefecture_id] }

      context '空欄の場合' do
        let(:prefecture_id) { nil }

        before { hairdresser.update(prefecture_id: prefecture_id) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'cityに関するテスト' do
      subject { hairdresser.errors[:city] }

      context '空欄の場合' do
        let(:city) { '' }

        before { hairdresser.update(city: city) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
        end
      end
    end

    context 'streetに関するテスト' do
      subject { hairdresser.errors[:street] }

      context '空欄の場合' do
        let(:street) { '' }

        before { hairdresser.update(street: street) }

        it 'エラーメッセージが返ってくるか' do
          is_expected.to include("を入力してください")
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

    context 'Roomモデルとの関係' do
      let(:target) { :rooms }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'UserCommunicationStyleモデルとの関係' do
      let(:target) { :user_communication_styles }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'UserHairStyleモデルとの関係' do
      let(:target) { :user_hair_styles }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'CommunicationStyleモデルとの関係' do
      let(:target) { :communication_styles }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'HairStyleモデルとの関係' do
      let(:target) { :hair_styles }

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
