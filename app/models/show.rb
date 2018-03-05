class Show < ApplicationRecord
  has_many :appearances
  has_many :user_shows
end
