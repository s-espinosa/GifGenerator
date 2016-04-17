class Category < ActiveRecord::Base
  validates :name, presence:   true,
                   format:     { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" },
                   uniqueness: true

  has_many :gifs
end
