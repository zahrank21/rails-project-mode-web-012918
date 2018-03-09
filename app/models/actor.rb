class Actor < ApplicationRecord
  has_many :appearances
  has_many :shows, through: :appearances
  has_many :user_actors
  has_many :users, through: :user_actors

  # validates :name, presence: true
  # validates :bio, length: {minimum: 10}
  # validates :gender, presence: true, inclusion: {in: %w(Male Female Other)}
  # validates :dob, presence: true
  # validates :pob, presence: true


  def avg(ratings)
    ratings.sum.to_f/ratings.length if ratings.length > 0
  end

  def add_rating(rating)
    self.ratings << rating
    numbers = self.ratings.split("").map {|rating| rating.to_i}
    self.rating = avg(numbers).round(1)
    self.save
  end

end
