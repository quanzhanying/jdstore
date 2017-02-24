class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def add_to_cart
    @food = Food.find(params[:id])
    if !current_cart.foods.include?(@food)
      current_cart.add_food_to_cart(@food)
      flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已经成功将 #{@food.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
end
