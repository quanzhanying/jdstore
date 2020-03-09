class Admin::BaseController < ApplicationController

  layout 'layouts/admin'
  before_action :authenticate_user!
  before_action :admin_required
  before_action :fetch_home_data #這樣寫會增加數據查詢量，後續更新

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  def fetch_home_data
    @categories = Category.grouped_data
  end

end
