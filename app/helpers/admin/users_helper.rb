module Admin::UsersHelper
  def render_user_status(user)
    if user.is_admin
      content_tag(:span, "", :class => "fa fa-unlock")
    else
      content_tag(:span, "", :class => "fa fa-lock")
    end
  end
end
