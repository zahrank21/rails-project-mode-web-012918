module ApplicationHelper
  def login(user_name)
    found_user = User.find_by(name: user_name)
    session[:user_id] = found_user.id
  end


  def logged_in?
    !!session[:user_id]
    # session[:user_id] != nil || session[:user_id] != ""
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end
end
