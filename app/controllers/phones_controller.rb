class PhonesController < ApplicationController
  def index
    @phones = Phone.all
  end

  def show
    @phone = Phone.find(params[:id])
  end

  def add_to_cart
    @phone = Phone.find(params[:id])
    if !current_cart.phones.include?(@phone)
      current_cart.add_phone_to_cart(@phone)
      flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已经成功将 #{@phone.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
end
