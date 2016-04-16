require "test_helper"

class AdminCanCreateCategoryTest < ActionDispatch::IntegrationTest
  test "admin can create a new category" do
    login_admin
    new_category = "kitten"

    visit new_admin_category_path
    fill_in "category[name]", with: new_category
    click_on "Submit"

    assert page.has_content?(new_category)
    assert page.has_content?("Category successfully created.")
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
