require 'test_helper'

class AdminCanAddGifsToCategoryTest < ActionDispatch::IntegrationTest
  test "admin can add gifs to a new category" do
    login_admin
    visit new_admin_category_path
    fill_in "category[name]", with: "sloths"
    click_on "Search"

    assert_equal new_admin_category_gif_path(Category.find_by(name: "sloths").id), current_path

    page.check("1")
    page.check("14")
    page.check("12")
    click_on "Add Gifs"

    assert_equal admin_category_path(Category.find_by(name: "sloths").id), current_path
    assert page.has_content?("sloths")
    url = Gif.last.url
    assert page.has_css?("img[src*='#{url}']")
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
