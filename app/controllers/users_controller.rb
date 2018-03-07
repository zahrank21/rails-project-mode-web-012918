class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  # include ApplicationHelper


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

  # def following
  #   byebug
  #   @user = User.find(session[:user_id])
  #   redirect_to @user
  # <%= form_for :url => {:controller => "users", :action => "/users/#{session[:user_id]}/following"} do |f| %>
  #   <%= f.hidden_field name: "<%= @show.title %>" %>
  #   <%= f.submit "Follow Show" %>
  # <% end %><br>
  # end

  def index
    @users = User.all
  end

  def edit
    if current_user? || admin?
      set_user
    else
      redirect_to '/'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.delete
    redirect_to '/'
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
