class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def show
    @show = Show.find(params[:id])
  end

  def create
    @show = Show.new(get_params)
    if @show.valid?
      @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:show).permit(:title, :characters, :cast, :status, :genres, :created_by, :image, :rating)
  end

end
