class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  include UsersHelper


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if params[:user][:admin_pin] == "1234"
      @user.admin = true
    end
    if @user.save
      login(@user.id)
      redirect_to @user
    else
      render :new
    end
  end

  def show

  end

  def following
    @user = User.find(session[:user_id])
    if params[:show_id]
      add_show(@user, params[:show_id])
    elsif params[:actor_id]
      add_actor(@user, params[:actor_id])
    end
    redirect_to @user
   end

  def index
    @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

end
