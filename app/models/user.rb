class User < ApplicationRecord
  has_many :user_actors
  has_many :user_shows
end
