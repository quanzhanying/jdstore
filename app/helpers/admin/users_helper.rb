module Admin::UsersHelper
  def render_user_level(user)
  if user.is_admin
    "Admin ^_^"
  else
    "User -_-||"
  end
end
end
