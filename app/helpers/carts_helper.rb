module CartsHelper

  def render_cart_total_price(cart)
    cart.total_price
    # 算总价不该是helper的任务，而是model的任务，所以我们refactor到model中去
  end
end
