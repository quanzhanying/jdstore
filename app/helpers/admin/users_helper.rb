module Admin::UsersHelper
    def render_user_status(user)
      if user.is_admin
        content_tag(:span, "", :class => "fa fa-lock")
      else
        content_tag(:span, "", :class => "fa fa-globe")
      end
    end
end
