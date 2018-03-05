class User < ApplicationRecord
  has_many :user_actors
  has_many :user_shows

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
