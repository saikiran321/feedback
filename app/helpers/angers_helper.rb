module AngersHelper

  def change_level(post, level)
    Anger.find_by("user_id=? AND post_id=?", current_user.id, post.id).update_attribute(level: level)
  end

end
