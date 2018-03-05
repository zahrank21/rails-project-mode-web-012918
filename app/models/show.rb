class Show < ApplicationRecord
  has_many :appearances
  has_many :user_shows

  validates :title, presence: true, uniqueness: true
  validates :characters, presence: true
  validates :status, inclusion: {in: %w(Ended Running)}
  validates :genres, inclusion: {in: %w(Drama Science-Fiction Thriller Action Crime Horror Romance)}


end
