require 'test_helper'

class AdminCanViewAllCategoriesTest < ActionDispatch::IntegrationTest
  test "admin can see the categories page" do
    Category.create(name: "kittens")
    Category.create(name: "puppies")
    Category.create(name: "penguins")
    login_admin

    visit admin_categories_path

    assert page.has_content?("kittens")
    assert page.has_content?("puppies")
    assert page.has_content?("penguins")
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
