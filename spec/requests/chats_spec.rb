# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Chats", type: :request do
  let(:user) { create(:user) }
  let(:hairdresser) { create(:hairdresser) }
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:chat) { create(:chat, user_id: user.id, room_id: room.id) }
  let(:chat_params) { { chat: { user_id: user, content: "hoge", created_at: "2021-02-08 11:38:31", updated_at: "2021-02-08 11:38:31" } } }

  describe 'チャットページのテスト(GET #show)' do
    context 'アクセス制限のテスト' do
      context "ログインしている場合" do
        before do
          sign_in user
          get chat_path(user)
        end

        it "リクエストが成功すること" do
          expect(response).to have_http_status "200"
        end
      end

      context "ログインしていない場合" do
        it "リクエストが失敗すること" do
          get chat_path(user)
          expect(response).to have_http_status "302"
        end

        it 'ログインページへ遷移しているか' do
          get chat_path(user)
          expect(response.body).to include "ログインしてください。"
        end
      end
    end

    context '画面表示内容のテスト' do
      before do
        sign_in user
        get chat_path(user)
      end

      context '投稿をしたとき(POST #create)' do
        it '投稿後正しく画面が表示されること' do
          byebug
          post chats_path(chat_params), xhr: true
          expect(response).to have_http_status "200"
        end

        it '非同期にてメッセージが正常に保存されていること' do
          post chats_path(chat_params), xhr: true
          expect(response.body).to include 'hoge'
        end
      end

      # context '投稿がある場合' do
      #   it '自分のツイートにツイートを消すボタンが出ているか' do
      #     expect(response.body).to include 'つぶやきを消す'
      #   end

      #   it '自分以外のツイートにフォロー、いいね、はなしてみるボタンが出ているか' do
      #     expect(response.body).to include 'フォロー'
      #   end

      #   it ''
      # end
    end
  end
end