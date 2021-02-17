# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'フォローに関するテスト' do
  let!(:user) { create(:user) }

  describe 'フォロー一覧ページ' do
    context 'アクセス制限のテスト' do
      context "ログインしている場合" do
        before do
          sign_in user
          get user_follows_path(user)
        end
  
        it "リクエストが成功すること" do
          expect(response).to have_http_status "200"
        end
      end
  
      context "ログインしていない場合" do
        it "リクエストが失敗すること" do
          get user_follows_path(user)
          expect(response).to have_http_status "302"
        end
      end
    end
  end
end
