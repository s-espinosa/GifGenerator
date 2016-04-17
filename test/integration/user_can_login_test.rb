require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "user can login" do
    login_user

    assert_equal gifs_path, current_path
    assert page.has_content?("All Gifs")
    assert page.has_content?("Hello #{@user.username}")
  end

  test "user must enter a valid username to login" do
    username = "username"
    password = "password"
    @user = User.create(username: username, password: password)

    visit '/'
    fill_in 'session[password]', with: password
    click_on "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Please try again")
  end

  test "user must enter a valid password to login" do
    username = "username"
    password = "password"
    @user = User.create(username: username, password: password)

    visit '/'
    fill_in 'session[username]', with: username
    fill_in 'session[password]', with: "joe"
    click_on "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Please try again")

    fill_in 'session[username]', with: username
    click_on "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Please try again")
  end

  test "user can logout" do
    login_user
    assert page.has_content?("Hello #{@user.username}")
    click_on "Logout"

    refute page.has_content?("Hello #{@user.username}")
    assert page.has_content?("Register")
    assert page.has_button?("Login")
    assert_equal root_path, current_path
  end

  def login_user
    username = "username"
    password = "password"
    @user = User.create(username: username,
                        password: password)

    visit '/'
    fill_in 'session[username]', with: username
    fill_in 'session[password]', with: password
    click_on 'Login'
  end
end
