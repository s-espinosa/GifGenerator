require 'test_helper'

class UserCanSeeAllGifsSortedByCategory < ActionDispatch::IntegrationTest
  test "user can see all gifs" do
    create_categories
    create_gifs
    login_user

    assert page.has_content?("rabbits")
    assert page.has_css?("img[src*='https://media4.giphy.com/media/Dx4YV2JowBTW0/200w.gif']")
    assert page.has_content?("sloths")
    assert page.has_css?("img[src*='http://media0.giphy.com/media/26xoplW0VhLLByrAY/200w.gif']")
    assert page.has_content?("kittens")
    assert page.has_css?("img[src*='http://media3.giphy.com/media/oL5LPpbJrGZxe/200w.gif']")
  end

  test "user can favorite gifs" do
    create_categories
    create_gifs
    login_user

    visit new_favorite_path
    assert page.has_content?("rabbits")
    assert page.has_css?("img[src*='https://media4.giphy.com/media/Dx4YV2JowBTW0/200w.gif']")
    assert page.has_content?("sloths")
    assert page.has_css?("img[src*='http://media0.giphy.com/media/26xoplW0VhLLByrAY/200w.gif']")
    assert page.has_content?("kittens")
    assert page.has_css?("img[src*='http://media3.giphy.com/media/oL5LPpbJrGZxe/200w.gif']")

    page.check("sloths1")
    page.check("rabbits2")
    page.check("kittens3")
    click_on "Favorite Gifs"

    assert_equal favorites_path, current_path
    assert page.has_css?("img[src*='http://media0.giphy.com/media/26xoplW0VhLLByrAY/200w.gif']")
    assert page.has_css?("img[src*='http://media1.giphy.com/media/NJ2B6cOfyEpJS/200w.gif']")
    assert page.has_css?("img[src*='http://media3.giphy.com/media/FPNiGHMGcsl6o/200w.gif']")
  end

  test "user can un-favorite gifs" do
    create_categories
    create_gifs
    login_user
    favorite_gifs

    click_on "1-delete"

    assert_equal favorites_path, current_path
    refute page.has_content?("rabbits")
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

  def create_categories
    @rabbits = Category.create(name: "rabbits")
    @sloths  = Category.create(name: "sloths")
    @kittens = Category.create(name: "kittens")
  end

  def create_gifs
    Gif.create(url: "https://media4.giphy.com/media/Dx4YV2JowBTW0/200w.gif", category_id: @rabbits.id)
    Gif.create(url: "http://media1.giphy.com/media/NJ2B6cOfyEpJS/200w.gif", category_id: @rabbits.id)
    Gif.create(url: "http://media3.giphy.com/media/pwmTmPTGrb5LO/200w.gif", category_id: @rabbits.id)

    Gif.create(url: "http://media0.giphy.com/media/26xoplW0VhLLByrAY/200w.gif", category_id: @sloths.id)
    Gif.create(url: "http://media0.giphy.com/media/1xkMJIvxeKiDS/200w.gif", category_id: @sloths.id)
    Gif.create(url: "http://media0.giphy.com/media/ThHSCmkz0CUI8/200w.gif", category_id: @sloths.id)

    Gif.create(url: "https://media0.giphy.com/media/t7MWRoExDRF72/200w.gif", category_id: @kittens.id)
    Gif.create(url: "http://media3.giphy.com/media/oL5LPpbJrGZxe/200w.gif", category_id: @kittens.id)
    Gif.create(url: "http://media3.giphy.com/media/FPNiGHMGcsl6o/200w.gif", category_id: @kittens.id)
  end

  def favorite_gifs
    visit new_favorite_path
    page.check("sloths1")
    page.check("rabbits2")
    page.check("kittens3")
    click_on "Favorite Gifs"
  end
end
