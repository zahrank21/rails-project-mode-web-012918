class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !User.find_by(name: params[:user][:name])
      redirect_to '/login'
    else
      login(params[:user][:name])
      redirect_to '/'
    end
  end

  def logout
    session.delete :user_id
    redirect_to '/'
  end
end
