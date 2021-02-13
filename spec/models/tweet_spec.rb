# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe Tweet, "モデルに関するテスト", type: :model do
  subject { tweet.valid? }

  let!(:user) { create(:user) }
  let!(:tweet) { build(:tweet, user_id: user.id) }

  describe 'ツイート投稿時のデータ保存' do
    it 'bodyカラムに値が設定されていれば正しく保存されるか' do
      expect(tweet).to be_valid
    end
    it 'bodyカラムが空欄の場合エラーメッセージが返ってきているか' do
      tweet.body = ''
      is_expected.to eq false
      expect(tweet.errors[:body]).to include("を入力してください")
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }

      it 'N:1となっているか' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Likeモデルとの関係' do
      let(:target) { :likes }

      it '1:Nとなっているか' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
