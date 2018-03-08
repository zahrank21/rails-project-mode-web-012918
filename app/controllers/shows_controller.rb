class ShowsController < ApplicationController
before_action :get_show, only: [:update, :destroy]

  def index
    @shows = Show.all
  end

  def new
    if logged_in? && admin?
      @show = Show.new
    else
      redirect_to '/'
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
    @show.ratings = []
    @show.actor_ids=(params[:show][:actor_ids])
    if @show.valid?
      @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def rate
    @show = Show.find(params[:show][:show_id].to_i)
    if params[:show][:rating] != nil
      @show.add_rating(params[:show][:rating])
    end
    redirect_to @show
  end

  def edit
    if logged_in? && admin?
      get_show
    else
      redirect_to '/'
    end
  end

  def update
    @show.actors.clear
    @show.actor_ids=(params[:show][:actor_ids])
    if @show.update(get_params)
      redirect_to @show
    else
      render :edit
    end
  end

  def destroy
    @show.delete
    redirect_to shows_path
  end

  private

  def get_params
    params.require(:show).permit(:title, :characters, :cast, :status, :genres, :created_by, :image, :rating, :actor_ids)
  end

  def get_show
    @show = Show.find(params[:id])
  end
end
