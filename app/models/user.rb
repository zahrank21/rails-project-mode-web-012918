class User < ApplicationRecord
  has_many :user_actors
  has_many :actors, through: :user_actors
  has_many :actor_shows, through: :actors, source: :shows
  has_many :user_shows
  has_many :shows, through: :user_shows

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def all_shows
    (self.shows + self.actor_shows).uniq
  end

  def user_genres
    self.shows.map {|show| show.genres}
  end

  def not_following?(show)
    !self.shows.include?(show)
  end
end
