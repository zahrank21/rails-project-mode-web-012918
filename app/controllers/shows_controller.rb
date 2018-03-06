class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def new
    if logged_in?
      @show = Show.new
    else
      redirect_to '/login'
    end

  end

  def show
    if Show.exists?(params[:id])
      @show = Show.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @show = Show.new(get_params)
    @show.actor_ids=(params[:show][:actor_ids])
    if @show.valid?
      @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:show).permit(:title, :characters, :cast, :status, :genres, :created_by, :image, :rating, :actor_ids)
  end

end
