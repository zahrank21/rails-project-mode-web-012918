module ApplicationHelper
  def login(user_id)
    session[:user_id] = user_id
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

  def admin?
    current_user.admin == true
  end

  def current_user?
    if current_user
      if current_user.id == params[:id].to_i
        return true
      end
    end
  end

  def user_genres
<<<<<<< HEAD
    genres = []
    current_user.shows.each do |show|
      genres << shows.genres
    end
  end


=======
    current_user.shows.map {|show| show.genres}
  end

>>>>>>> zahran-branch

end
