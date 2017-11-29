module Admin::OrdersHelper
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end
  
end
