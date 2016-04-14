require 'test_helper'

class UserVisitsRootPageTest < ActionDispatch::IntegrationTest
  test "user can visit the root page and see a welcome" do
    visit '/'

    assert page.has_content?("Welcome")
  end
end
