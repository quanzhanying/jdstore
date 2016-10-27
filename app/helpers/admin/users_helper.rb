module Admin::UsersHelper
  def render_is_admin(user)
    if user.is_admin
      content_tag(:span, "", :class => "fa fa-globe")
    else
      content_tag(:span, "", :class => "fa fa-lock")
    end
  end
end
