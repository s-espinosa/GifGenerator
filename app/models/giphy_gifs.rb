require 'faraday'

class GiphyGifs
  def initialize(category = "sloths")
    @search_url = "http://api.giphy.com/v1/gifs/search?q=#{category}&api_key=dc6zaTOxFJmzC"
  end

  def gif_urls
    giphy_json["data"].map do |gif|
      gif["images"]["fixed_width"]["url"]
    end
  end

  def giphy_json
    JSON.parse(Faraday.get(@search_url).body)
  end
end
