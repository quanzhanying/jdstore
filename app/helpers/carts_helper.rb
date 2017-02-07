module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
 end

 def clean
   current_cart.clean!
   flash[:warning] = "已清空购物车"
   redirect_to carts_path
 end
end
