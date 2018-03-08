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


end
