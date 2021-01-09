# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do

  let!(:user) { build(:user) }
  describe '新規登録時のデータ保存' do
    it '表示されている内容に値が設定されていれば正しく保存される' do
      expect(user).to be_valid
    end
  end

  context '新規登録時バリデーションのチェック' do
    it 'usernameが空の場合エラーメッセージが返ってきているか' do
      user.username = ''
      expect(user).to be_invalid
      expect(user.errors[:username]).to include("を入力してください")
    end

    it 'emailが空の場合エラーメッセージが返ってきているか' do
      user.email = ''
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'passwordが空の場合エラーメッセージが返ってきているか' do
      user.password = ''
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("を入力してください")
    end
  end


  context 'プロフィール更新時バリデーションのチェック' do
    let(:user) { create(:user) }
    it 'usernameが空の場合エラーメッセージが返ってきているか' do
      user.username = ''
      expect(user).to be_invalid
      expect(user.errors[:username]).to include("を入力してください")
    end
    it 'nameが空の場合エラーメッセージが返ってきているか' do
      user.update(name: nil)
      expect(user.update).to be_invalid
      expect(user.errors[:name]).to include("を入力してください")
    end
    it 'yearが空の場合エラーメッセージが返ってきているか' do
      user.year = nil
      expect(user.update).to be_invalid
      expect(user.errors[:year]).to include("を入力してください")
    end
  end
end