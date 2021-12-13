module LoginModule
  def login(user)
    visit admin_login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    click_button '送信'
  end
end