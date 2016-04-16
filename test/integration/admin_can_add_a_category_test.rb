require "test_helper"

class AdminCanCreateCategoryTest < ActionDispatch::IntegrationTest
  test "admin can create a new category" do
    # as an admin
    # if I login
    login_admin
    new_category = "kitten"

    # and I visit the new categories page
    visit new_admin_category_path
    # and I enter a search term (form)
    fill_in "category[name]", with: new_category
    # and click on search (submit)
    click_on "Submit"

    # then I will see a category page I will see the newly created category
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
