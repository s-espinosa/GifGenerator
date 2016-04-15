require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "user can login" do
    username = "username"
    password = "password"
    @user = User.new(username: username, password_digest: password)

    visit '/'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Login'

    assert_equal gifs_path, current_path
    assert page.has_content?("All Gifs")
    assert page.has_content?("Hello #{@user.username}")
  end
end
