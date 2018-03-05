class Actor < ApplicationRecord
  has_many :appearances
  has_many :user_actors
end
