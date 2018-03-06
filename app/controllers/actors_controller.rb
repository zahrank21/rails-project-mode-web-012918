class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    if logged_in?
      @actor = Actor.new
    else
      redirect_to '/login'
    end
  end

  def show
    if Actor.exists?(params[:id])
      @actor = Actor.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @actor = Actor.new(get_params)
    if @actor.valid?
      @actor.save
      redirect_to actor_path(@actor)
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:actor).permit(:name, :bio, :gender, :age, :dob, :pob, :image, :rating)
  end

end
