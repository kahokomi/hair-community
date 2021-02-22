# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Tweets", type: :request do
  describe 'ツイートに関するテスト' do
    let!(:user) { create(:user) }
    let!(:hairdresser) { create(:hairdresser) }
    let!(:tweet1) { create(:tweet, user_id: user.id) }
    let!(:tweet2) { create(:tweet, user_id: hairdresser.id) }
    let(:tweet_params) { { tweet: { user_id: user, body: "hoge" } } }
  
    describe 'ツイート一覧ページのテスト(GET #index)' do
      context 'アクセス制限のテスト' do
        context "ログインしている場合" do
          before do
            sign_in user
            get tweets_path(user)
          end
  
          it "リクエストが成功すること" do
            expect(response).to have_http_status "200"
          end
        end
  
        context "ログインしていない場合" do
          it "リクエストが失敗すること" do
            get tweets_path(user)
            expect(response).to have_http_status "401"
          end
          
          it 'ログインページへ遷移しているか' do
            get tweets_path(user)
            expect(response.body).to include "ログインしてください。"
          end
        end
      end
      
      context '画面表示内容のテスト' do
        before do
          sign_in user
          get tweets_path(user)
        end
        
        context '投稿をしたとき(POST #create)' do
          it '投稿後正しく画面が表示されること' do
            post tweets_path(tweet_params), xhr: true
            expect(response).to have_http_status "200"
          end
          
          it '非同期にてメッセージが正常に保存されていること' do
            post tweets_path(tweet_params), xhr: true
            expect(response.body).to include 'hoge'
          end
        end
        
        context '投稿を削除したとき(DELETE #destroy)' do
          before do
            post tweets_path(tweet_params), xhr: true
          end
            
          it '削除のダイアログが表示されるか' do
          end
          
          # it '削除に成功するか' do
          #   delete tweet_path(id: tweet_params), xhr: true
          #   expect(response.body).not_to include 'hoge'
          # end
          
          it '別のユーザーから削除されないか' do
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
end
