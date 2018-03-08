class ActorsController < ApplicationController
  before_action :get_actor, only: [:update, :destroy]
  def index
    @actors = Actor.all
  end

  def new
    if logged_in? && admin?
      @actor = Actor.new
    else
      redirect_to '/'
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
    @actor.ratings = []
    if @actor.valid?
      @actor.save
      redirect_to actor_path(@actor)
    else
      render :new
    end
  end

  def edit
    if logged_in? && admin?
      get_actor
    else
      redirect_to '/'
    end
  end

  def update
    if @actor.update(get_params)
      redirect_to @actor
    else
      render :edit
    end
  end

  def rate
    @actor = Actor.find(params[:actor][:actor_id].to_i)
    if params[:actor][:rating] != nil
      @actor.add_rating(params[:actor][:rating])
    end
    redirect_to @actor
  end

  def destroy
    @actor.delete
    redirect_to actors_path
  end

  private

  def get_params
    params.require(:actor).permit(:name, :bio, :gender, :age, :dob, :pob, :image, :rating)
  end

  def get_actor
    @actor = Actor.find(params[:id])
  end

end
