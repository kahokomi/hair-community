# frozen_string_literal: true

require 'rails_helper'

describe 'チャットに関するテスト' do
  let!(:user) { create(:user) }
  let!(:room) { create(:room) }
  let!(:chat) { create(:chat, user_id: user.id, room_id: room.id) }

  describe 'チャットページに関するテスト' do
    before do
      sign_in_as(user)
      visit chat_path(chat)
    end
    context '表示に関するテスト' do
      it 'チャットのフォームが表示されているか' do
        expect(page).to have_css '#chat_content'
      end
    end
    context '投稿に関するテスト', js: true do
      it '内容が入力されている時正しく表示されるか' do
        fill_in 'chat[content]', with: chat.content
        click_button '送信'
        expect(page).to have_css "text-right"
      end

      it '内容が入力されていない時なにも表示されないか', js: true do
        fill_in 'chat[content]', with: ''
        click_button '送信'
        expect(page).not_to have_css "text-right"
      end
    end
  end
end