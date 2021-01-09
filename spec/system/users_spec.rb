# frozen_string_literal: true

require 'rails_helper'

describe 'トップページに関するテスト' do
  let!(:user) { create(:user) }
  describe '新規登録に関するテスト' do
    before do
      visit new_user_registration_path
    end
    context '新規登録成功' do
      it '新規登録後、ツイート一覧画面へ遷移' do
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[username]', with: 'hogehoge'
        choose '美容師'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq tweets_path
      end
    end
    context '新規作成失敗' do
      it 'メールアドレス未入力の場合' do
        fill_in 'user[email]', with: ''
        fill_in 'user[username]', with: 'hogehoge'
        choose '美容師'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "メールアドレスを入力してください"
      end
      it '登録済みメールアドレスの場合' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[username]', with: 'hogehoge'
        choose '美容師'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "メールアドレスはすでに存在します"
      end
      it '登録済みユーザーネームの場合' do
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[username]', with: user.username
        choose '美容師'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "ユーザーネームはすでに存在します"
      end
    end
  end
  describe 'ログインに関するテスト' do
    before do
      visit new_user_session_path
    end
    it 'ログイン成功後ツイート一覧画面へ遷移' do
      fill_in 'user[username]', with: user.username
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq tweets_path
    end
    it 'ログイン失敗' do
      fill_in 'user[username]', with: 'wrong_username'
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq user_session_path
    end
  end

  describe 'マイページに関するテスト' do
    context 'プロフィール編集に関するテスト' do
      it 'ユーザーIDが空欄の時保存されないか' do
      end
      it ''
    end
    context ''
  end
end