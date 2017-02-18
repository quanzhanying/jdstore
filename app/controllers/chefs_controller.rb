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
      flash[:warning] = "当前购物车已清空！请重新选择菜品！"
      current_cart.clean!
    end
    current_cart.chef_id = @chef.id
    current_cart.save
    #@products = Product.where(style: params[:style])
    redirect_to products_path

  end

  def follow
    @chef = Chef.find(params[:id])
    current_user.follow!(@chef)

    redirect_to :back
  end

  def unfollow
    @chef = Chef.find(params[:id])
    current_user.unfollow!(@chef)

    #flash[:warning] = "Stop follow!"
    redirect_to :back
  end
end
