module Admin::UsersHelper

  def king!
    user.is_admin = true
    user.save
  end

  def nobody!
    user.is_admin = false
    user.save
    redirect_to :back
  end
end
