class User < ApplicationRecord
  has_many :user_actors
  has_many :actors, through: :user_actors
  has_many :user_shows
  has_many :shows, through: :user_shows


  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
