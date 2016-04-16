require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def valid_attributes
    {name: "kittens"}
  end

  test "it creates a category" do
    result = Category.new(valid_attributes)

    assert result.valid?
    assert_equal "kittens", result.name
  end

  test "is invalid without a name" do
    result = Category.new()

    assert result.invalid?, "Category is not valid without a name"
  end

  test "it cannot create a category with the same name" do
    2.times { Category.create(valid_attributes) }

    result = Category.where(name: "kittens")
    assert_equal 1, result.count
  end

  test "it does not accept spaces in a name" do
    category = Category.new(name: "Johnny Appleseed")

    refute category.valid?
  end
end
