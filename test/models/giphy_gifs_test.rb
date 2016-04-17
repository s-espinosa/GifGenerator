require 'test_helper'

class GiphyGifsTest < ActiveSupport::TestCase
  test "a giphy gifs object can be created" do
    giphy_gifs = GiphyGifs.new

    assert_kind_of GiphyGifs, giphy_gifs
  end

  test "it takes an optional category parameter" do
    giphy_gifs = GiphyGifs.new("kittens")

    assert_kind_of GiphyGifs, giphy_gifs
  end

  test "it can find gif urls using giphy" do
    gif_urls  = GiphyGifs.new("kittens").gif_urls
    first_url = gif_urls.first
    url_chars = first_url.chars
    prefix    = url_chars[0..3].join("")

    assert_equal "http", prefix
  end
end
