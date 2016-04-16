require 'test_helper'

class AdminCanLoginTest < ActionDispatch::IntegrationTest
  test "user can login" do
    login_admin

    visit admin_categories_path

    assert page.has_content?("All Categories")
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
