# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "Tweetモデルに関するテスト", type: :model do
  let!(:user) { create(:user) }
  let!(:tweet) { build(:tweet, user_id: user.id) }
  describe 'ツイート投稿時のデータ保存' do
    it 'bodyカラムに値が設定されていれば正しく保存される' do
      expect(tweet).to be_valid
    end
    it 'bodyカラムが空欄の場合エラーメッセージを表示する' do
      tweet.body = ''
      expect(tweet).to be_invalid
      expect(tweet.errors[:body]).to include("を入力してください")
    end
  end
end