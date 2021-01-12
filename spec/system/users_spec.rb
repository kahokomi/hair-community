# frozen_string_literal: true

require 'rails_helper'

describe 'トップページに関するテスト' do
  let!(:user) { create(:user) }
  let!(:hairdresser) { create(:hairdresser) }
  describe '新規登録に関するテスト' do
    before do
      visit new_user_registration_path
    end
    context '新規登録成功' do
      it '新規登録後、ツイート一覧画面へ遷移' do
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[username]', with: Faker::Lorem.characters(number: 6)
        choose '一般の方'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq tweets_path
      end
    end
    context '新規作成失敗' do
      it 'メールアドレス未入力の場合エラーメッセージが出るか' do
        fill_in 'user[email]', with: ''
        fill_in 'user[username]', with: Faker::Lorem.characters(number: 6)
        choose '一般の方'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "メールアドレスを入力してください"
      end
      it '登録済みメールアドレスの場合エラーメッセージが出るか' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[username]', with: Faker::Lorem.characters(number: 6)
        choose '一般の方'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "メールアドレスはすでに存在します"
      end
      it '登録済みユーザーネームの場合エラーメッセージが出るか' do
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[username]', with: user.username
        choose '一般の方'
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
    it 'ログイン成功後ツイート一覧画面へ遷移しているか' do
      fill_in 'user[username]', with: user.username
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq tweets_path
    end
    it 'ログイン失敗でログインページに戻っているか' do
      fill_in 'user[username]', with: Faker::Lorem.characters(number: 6)
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq user_session_path
    end
  end

  describe 'マイページに関するテスト' do
    describe 'プロフィール詳細' do
      context 'アクセス制限に関するテスト' do
        context '美容師' do
          context 'ログインしている場合' do
            before do
              sign_in_as(hairdresser)
              visit user_path(hairdresser)
            end
            it '美容師歴、所属、役職、過去の作品が表示されているか' do
              expect(page).to have_content hairdresser.year
              expect(page).to have_content hairdresser.hair_salon
              expect(page).to have_content hairdresser.position
              expect(page).to have_content '過去の作品'
            end
          end
          context 'ログアウトしている場合' do
            before do
              visit user_path(hairdresser)
            end
            it 'ログインページへ遷移しているか' do
              expect(current_path).to eq user_session_path
            end
          end
        end

        context '一般ユーザ' do
          context 'ログインしている場合' do
            before do
              sign_in_as(user)
              visit user_path(user)
            end
            it '職業が表示されているか' do
              expect(page).to have_content user.job
            end
          end
          context 'ログアウトしている場合' do
            before do
              visit user_path(user)
            end
            it 'ログインページへ遷移しているか' do
              expect(current_path).to eq user_session_path
            end
          end
        end
      end
    end

    describe 'プロフィール編集に関するテスト' do
      context 'アクセス制限のチェック' do
        context '詳細ページの編集ボタンをクリック' do
          before do
            sign_in_as(user)
            visit user_path(user)
          end
          it '正しく遷移されているか' do
            click_on '編集'
            visit edit_user_path(user)
            expect(page).to have_content 'プロフィール編集'
          end
        end
        context 'ログアウトしている場合' do
          before do
            visit user_path(user)
          end
          it 'ログインページへ遷移しているか' do
            expect(current_path).to eq user_session_path
          end
        end
      end
      context '入力チェック' do
        context '美容師側の入力チェック' do
          before do
            sign_in_as(hairdresser)
            visit edit_user_path(hairdresser)
          end
          context '正しく入力されている場合' do
            it '保存されユーザー詳細ページへ遷移しているか' do
              fill_in 'user[username]', with: hairdresser.username
              fill_in 'user[name]', with: hairdresser.name
              fill_in 'user[hair_salon]', with: hairdresser.hair_salon
              fill_in 'user[year]', with: hairdresser.year
              fill_in 'user[position]', with: hairdresser.position
              click_button '編集'
              expect(current_path).to eq user_path(hairdresser)
            end
          end

          context '空欄がある場合保存されないか' do
            it 'ユーザーネームの場合' do
              fill_in 'user[username]', with: ''
              fill_in 'user[name]', with: hairdresser.name
              fill_in 'user[hair_salon]', with: hairdresser.hair_salon
              fill_in 'user[year]', with: hairdresser.year
              fill_in 'user[position]', with: hairdresser.position
              click_button '編集'
              expect(page).to have_content "ユーザーネームを入力してください"
            end
            it '氏名の場合' do
              fill_in 'user[username]', with: hairdresser.username
              fill_in 'user[name]', with: ''
              fill_in 'user[hair_salon]', with: hairdresser.hair_salon
              fill_in 'user[year]', with: hairdresser.year
              fill_in 'user[position]', with: hairdresser.position
              click_button '編集'
              expect(page).to have_content "氏名を入力してください"
            end
            it '役職の場合' do
              fill_in 'user[username]', with: hairdresser.username
              fill_in 'user[name]', with: hairdresser.name
              fill_in 'user[hair_salon]', with: hairdresser.hair_salon
              fill_in 'user[year]', with: hairdresser.year
              fill_in 'user[position]', with: ''
              click_button '編集'
              expect(page).to have_content "役職を入力してください"
            end
            it '美容師歴の場合' do
              fill_in 'user[username]', with: hairdresser.username
              fill_in 'user[name]', with: hairdresser.name
              fill_in 'user[hair_salon]', with: hairdresser.hair_salon
              fill_in 'user[year]', with: ''
              fill_in 'user[position]', with: hairdresser.position
              click_button '編集'
              expect(page).to have_content "美容師歴を入力してください"
            end
            it '所属の場合' do
              fill_in 'user[username]', with: hairdresser.username
              fill_in 'user[name]', with: hairdresser.name
              fill_in 'user[hair_salon]', with: ''
              fill_in 'user[year]', with: hairdresser.year
              fill_in 'user[position]', with: hairdresser.position
              click_button '編集'
              expect(page).to have_content "所属を入力してください"
            end
          end
        end

        context '一般ユーザの入力チェック' do
          before do
            sign_in_as(user)
            visit edit_user_path(user)
          end
          context '正しく入力されている場合' do
            it '保存されユーザー詳細ページへ遷移しているか' do
              fill_in 'user[username]', with: user.username
              fill_in 'user[name]', with: user.name
              fill_in 'user[job]', with: user.job
              click_button '編集'
              expect(current_path).to eq user_path(user)
            end
          end

          context '空欄がある場合' do
            it '職業の場合' do
              fill_in 'user[username]', with: user.username
              fill_in 'user[name]', with: user.name
              fill_in 'user[job]', with: ''
              click_button '編集'
              expect(page).to have_content "職業を入力してください"
            end
          end
        end
      end
    end
  end
end