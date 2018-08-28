module ApplicationHelper
  def get_user_avatar(user)
    user.photo || "eat.png"
  end
end
