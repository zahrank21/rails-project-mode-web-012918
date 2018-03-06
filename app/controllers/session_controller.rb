class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      login(@user.id)
      redirect_to @user
    else
      redirect_to login_path
    end
  end


  def logout
    session.delete :user_id
    redirect_to '/'
  end
end
