class Actor < ApplicationRecord
  has_many :appearances
  has_many :shows, through: :appearances
  has_many :user_actors
  has_many :users, through: :user_actors

  validates :name, presence: true
  validates :bio, length: {minimum: 10}
  validates :gender, presence: true, inclusion: {in: %w(Male Female Other)}
  validates :dob, presence: true
  validates :pob, presence: true
  validates :rating, inclusion: {in: %w(0 1 2 3 4 5)}


end
