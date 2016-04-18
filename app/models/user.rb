class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence:   true,
                       uniqueness: true
  validates :password, presence: true

  has_many :favorites
  has_many :gifs,       through: :favorites
  has_many :categories, through: :gifs

  enum role: ["default", "admin"]
end
