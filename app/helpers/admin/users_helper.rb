module Admin::UsersHelper
  def render_user_status(user)
  if user.is_admin
      content_tag(:span, "", :class => "fa fa-user-secret")
  else
      content_tag(:span, "", :class => "fa fa-user")
  end
end
end