class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def welcome
  end

  def search
    if Show.exists?(title: params[:search])
      show = Show.find_by(title: params[:search])
      redirect_to show_path(show)
    elsif Actor.exists?(name: params[:search])
      actor = Actor.find_by(name: params[:search])
      redirect_to actor_path(actor)
    end
  end
end
