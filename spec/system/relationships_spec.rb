# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'フォローに関するテスト' do
  let!(:user) { create(:user) }

  describe 'フォロー一覧ページ' do
    context 'アクセス制限のテスト' do
      context 'ログインしている場合' do
        before do
          sign_in_as(user)
          visit user_follows_path(user)
        end

        it 'ページの内容が表示されるか' do
          expect(page).to have_css '.badge'
        end
      end

      context 'ログアウトしている場合' do
        before do
          visit user_follows_path(user)
        end

        it 'ログインページへ遷移しているか' do
          expect(current_path).to eq user_session_path
        end
      end
    end
  end
end
