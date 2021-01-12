# frozen_string_literal: true

require 'rails_helper'

describe 'ツイートに関するテスト' do
  let!(:user) { create(:user) }
  let!(:hairdresser) { create(:hairdresser) }
  let!(:tweet1) { create(:tweet, user_id: user.id) }
  let!(:tweet2) { create(:tweet, user_id: hairdresser.id) }

  describe 'アクセス制限に関するテスト' do
    context 'ログインしている場合' do
      before do
        sign_in_as(user)
        visit tweets_path
      end
      it 'タブの美容師、一般ユーザの表示がされているか' do
        expect(page).to have_link '美容師'
        expect(page).to have_link '一般ユーザ'
      end
    end

    context 'ログアウトしている場合' do
      before  do
        visit visit tweets_path
      end
      it 'トップページへ遷移しているか' do
        expect(current_path).to eq root_path
      end
    end
  end
  describe 'ツイートの一覧に関するテスト' do
    before do
      sign_in_as(user)
      visit tweets_path
    end
    context '投稿がある場合' do
      it '自分のツイートにツイートを消すボタンが出ているか' do
        expect(page).to have_link 'つぶやきを消す'
      end

      it '自分以外のツイートにフォロー、いいね、はなしてみるボタンが出ているか' do
        expect(page).to have_link 'フォロー'
      end
    end
    context '投稿した場合' do
      xit 'メッセージが表示されるか' do
        fill_in 'tweet[body]', with: 'hoge'
        click_button '投稿', js: true
        expect(page).to have_content 'successfully'
      end
      xit 'エラーメッセージが表示されるか' do
        click_button '投稿'
        expect(page).to have_content 'テキストを入力してください'
      end
    end
  end

  # context 'いいねをクリックした場合', js: true do
  #   it 'いいねできる' do
  #     find('.far.fa-heart').click
  #     expect(page).to have_css '.fas.fa-heart'
  #     expect(page).to have_css "div#likes_#{tweet2.id}", text: '1'
  #   end
  #   it 'いいね外す' do
  #     find('.far.fa-heart').click
  #     find('.fas.fa-heart').click
  #     expect(page).to have_css '.far.fa-heart'
  #     expect(page).to have_css "div#likes_#{tweet2.id}", text: '0'
  #   end
  # end

  # context 'フォローをクリックした場合', js: true do
  #   it 'フォローできる' do
  #     find("span#follow_#{tweet2.id}").click
  #     expect(page).to have_content 'フォロー解除'
  #   end
  # end
end