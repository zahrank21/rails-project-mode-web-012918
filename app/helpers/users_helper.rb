module UsersHelper
  def add_show(user, show_id)
    show = Show.find(show_id.to_i)
    user.shows << show unless @user.shows.include?(show)
  end

  def add_actor(user, actor_id)
    actor = Actor.find(actor_id.to_i)
    user.actors << actor unless @user.actors.include?(actor)
  end
end
