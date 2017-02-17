class ChefsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    @chefs = Chef.published
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def add_to_cart
    @chef = Chef.find(params[:id])
    if current_cart.chef_id != nil && @chef.id != current_cart.chef_id
      flash[:alert] = "更换厨师，清空当前购物车"
      current_cart.clean!
    end
    current_cart.chef_id = @chef.id
    current_cart.save
    #@products = Product.where(style: params[:style])
    redirect_to products_path

  end

end
