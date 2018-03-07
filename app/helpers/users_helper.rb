module UsersHelper
  def follow_show(show_id)
    show = Show.find(show_id.to_i)
    current_user.shows << show unless current_user.shows.include?(show)
  end

  def follow_actor(actor_id)
    actor = Actor.find(actor_id.to_i)
    current_user.actors << actor unless current_user.actors.include?(actor)
  end

  def unfollow_show(show_id)
    show = Show.find(show_id.to_i)
    current_user.shows.delete(show)
  end

  def unfollow_actor(actor_id)
    actor = Actor.find(actor_id.to_i)
    current_user.actors.delete(actor)
  end

  def following?(actor_or_show)
    current_user.actors.include?(actor_or_show) || current_user.shows.include?(actor_or_show)
  end
end
