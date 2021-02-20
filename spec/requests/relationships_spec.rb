# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'フォローに関するテスト' do
  describe 'フォロー一覧ページ' do
    let(:user) { create(:user) }
    let(:hairdresser) { create(:hairdresser) }
    
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
    
  describe "フォロー機能" do
    let(:following) { create(:user) }
    let(:follower)  { create(:hairdresser) }
    
    describe "ユーザーのフォロー" do
      context "ログインしている場合" do
        before do
          sign_in following
        end
  
        it "非同期によるフォローのリクエストが成功すること" do
          post user_relationships_path(follower.id), xhr: true
          expect(response).to have_http_status "200"
        end
        it "非同期によるフォロー関係の作成に成功すること" do
          expect do
            post user_relationships_path(follower.id), xhr: true
          end.to change(Relationship, :count).by(1)
        end
      end
    end
  
    describe "ユーザーのアンフォロー" do
      let!(:follow) { Relationship.create(following_id: following.id, follower_id: follower.id) }
  
      context "ログインしている場合" do
        before do
          sign_in following
        end
  
        it "非同期によるアンフォローのリクエストが成功すること" do
          delete user_relationships_path(follower.id), xhr: true
          expect(response.status).to eq 200
        end
        it "非同期によるフォロー関係が削除されること" do
          expect do
            delete user_relationships_path(follower.id), xhr: true
          end.to change(Relationship, :count).by(-1)
        end
      end
    end
  end
end
