class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_superadmin

  def index
    @user = User.all
  end

  def require_is_superadmin
    if !current_user.superadmin?
      redirect_to root_path, alert: "You are not superadmin seriously"
    end
  end
end
