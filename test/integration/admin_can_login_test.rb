require 'test_helper'

class AdminCanLoginTest < ActionDispatch::IntegrationTest
  test "admin can login" do
    login_admin

    visit admin_categories_path

    assert page.has_content?("All Categories")
  end

  test "non-admin can't see admin categories" do
    user = User.create(username: "user", password: "password")

    visit '/'
    fill_in 'session[username]', with: "user"
    fill_in 'session[password]', with: "password"
    click_on 'Login'
    visit admin_categories_path

    assert page.has_content?("doesn't exist")
  end

  def login_admin
    admin = User.create(
      username: "admin",
      password: "password",
      role:     1
    )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end
end
