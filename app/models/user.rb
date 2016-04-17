class User < ActiveRecord::Base
  has_secure_password

  has_many :favorites
  has_many :gifs,       through: :favorites
  has_many :categories, through: :gifs

  enum role: ["default", "admin"]
end
