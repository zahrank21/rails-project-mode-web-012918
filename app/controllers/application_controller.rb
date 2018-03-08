class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def welcome
  end

  def search
    term = params[:search]
    @found_shows = []
    @found_shows << Show.where('title LIKE ?', "%#{term}%")
    @found_actors = []
    @found_actors << Actor.where('name LIKE ?', "%#{term}%")
    @found_shows.flatten!
    @found_actors.flatten!
  end
end



# if Show.exists?(title: params[:search])
#   show = Show.find_by(title: params[:search])
#   redirect_to show_path(show)
# elsif Actor.exists?(name: params[:search])
#   actor = Actor.find_by(name: params[:search])
#   redirect_to actor_path(actor)
# end
