# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'


describe 'チャットに関するテスト' do
  let!(:user) { create(:user) }
  let!(:room) { create(:room) }
  let!(:chat) { create(:chat, user_id: user.id, room_id: room.id) }

  describe 'アクセス制限に関するテスト' do
    context 'ログインしている場合' do
      before do
        sign_in_as(user)
        visit chat_path(user)
      end

      it 'チャットのフォームが表示されているか' do
        expect(page).to have_css '#chat_content'
      end
    end

    context 'ログアウトしている場合' do
      before do
        visit chat_path(user)
      end

      it 'ログインページへ遷移しているか' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  # describe '投稿に関するテスト' do
  #   before do
  #     sign_in_as(user)
  #     visit chat_path(user)
  #   end
  # context '投稿がある場合' do
  #   it '表示されているか' do
  #     expect(page).to have_content chat.content
  #   end
  # end
  # xit '内容が入力されている時正しく表示されるか' do
  #   fill_in 'chat[content]', with: chat.content
  #   click_button '送信'
  #   expect(page).to have_css "text-right"
  # end

  # xit '内容が入力されていない時なにも表示されないか' do
  #   fill_in 'chat[content]', with: ''
  #   click_button '送信'
  #   expect(page).not_to have_css "text-right"
  # end
  # end
end
