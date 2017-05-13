class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end
  def add_to_cart
     @product = Product.find(params[:id])
     redirect_to :back
     flash[:notice] = "测试加入购物车"
   end
end
