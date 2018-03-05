class Show < ApplicationRecord
  has_many :appearances
  has_many :user_shows

  validates :title, presence: true, uniqueness: true

end
