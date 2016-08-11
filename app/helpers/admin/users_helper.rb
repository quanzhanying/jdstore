module Admin::UsersHelper

  def render_authority_operation(user)
    if user.is_admin
      link_to("Change to Customer", change_to_customer_admin_user_path(user), method: :post, class: "btn btn-default")
    else
      link_to("Change to Admin", change_to_admin_admin_user_path(user), method: :post, class: "btn btn-default")
    end
  end
end
