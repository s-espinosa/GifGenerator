require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  test "user can create an account" do
    visit "/"
    click_on "Register"
    assert_equal new_user_path, current_path
    fill_in "user_username", with: "Joe"
    fill_in "user_password", with: "password"
    click_on "Create Account"

    assert_equal gifs_path, current_path
    assert page.has_content?("All Gifs")
  end
end
