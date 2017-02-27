class CartTemplateItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_template_item = @cart.cart_template_items.find_by(template_id: params[:id])
    @template = @cart_template_item.template
    @cart_template_item.destroy

    flash[:warning] = "成功将 #{@template.title} 从购物车删除！"
    redirect_to :back
  end
end
