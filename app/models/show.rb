class Show < ApplicationRecord
  has_many :appearances
  has_many :actors, through: :appearances
  has_many :user_shows
  has_many :users, through: :user_shows

  validates :title, presence: true, uniqueness: true
  validates :status, inclusion: {in: %w(Ended Running)}
  validates :genres, inclusion: {in: %w(Drama Science-Fiction Thriller Action Crime Horror Romance Comedy)}




  def actor_ids=(ids)
    ids.each do |actor_id|
      actor = Actor.find(actor_id)
      self.actors << actor unless self.actors.include?(actor)
    end
  end



  def avg(ratings)
    ratings.sum.to_f/ratings.length if ratings.length > 0
  end

  def add_rating(rating)
    self.ratings << rating
    numbers = self.ratings.split("").map {|rating| rating.to_i}
    self.rating = avg(numbers).round(1)
    self.save
  end

  private

  def build_ratings
    self.build(ratings: [])
  end


end
