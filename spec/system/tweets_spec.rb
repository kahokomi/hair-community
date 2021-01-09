# frozen_string_literal: true

require 'rails_helper'

describe 'ツイートページ' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:other_user) }
  let!(:tweet1) { Tweet.create(user_id: user, body: 'hogehoge') }
  let!(:tweet2) { Tweet.create(user_id: other_user, body: 'hugahuga') }
  before do
    sign_in_as(user)
    visit tweets_path
  end
  context 'ツイート一覧ページに関するテスト' do
    it '美容師と一般ユーザの内容が分かれているか' do

    end
  end
  context 'ツイート単体に関するテスト' do
    it '自分のツイートにツイートを消すボタンが出ているか' do
      click_on '美容師'
      expect(page).to have_link 'つぶやきを消す'
    end
    it '自分以外のツイートにフォロー、いいね、はなしてみるボタンが出ているか' do
    end
    it '新規投稿の際、空欄で入力できないようになっているか' do
      
    end
  end
end