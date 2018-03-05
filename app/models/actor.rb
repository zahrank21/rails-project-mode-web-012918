class Actor < ApplicationRecord
  has_many :appearances
  has_many :user_actors

  validates :name, presence: true
  validates :bio, length: {minimum: 100}
  validates :gender, presence: true, inclusion: {in: %w(Male Female Other)}
  validates :age, presence: true
  validates :dob, presence: true
  validates :pob, presence: true

end
