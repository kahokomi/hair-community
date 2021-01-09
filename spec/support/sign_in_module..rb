module SignInModule
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
end