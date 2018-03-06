class User < ApplicationRecord
  has_many :user_actors
  has_many :actors, through: :user_actors
  has_many :user_shows
  has_many :shows, through: :user_shows

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
