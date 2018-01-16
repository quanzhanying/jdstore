class ProductsController < ApplicationController

  def index
    @products = Product.all.order("position ASC")
  end
  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end
  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
    def bouquet
      @products = Product.where(:category_id => 1).paginate(:page => params[:page], :per_page => 9)
    end

    def box_flower
      @products = Product.where(:category_id => 2).paginate(:page => params[:page], :per_page => 9)
    end

    def ceremony
      @products = Product.where(:category_id => 3).paginate(:page => params[:page], :per_page => 9)
    end

    def micro
      @products = Product.where(:category_id => 4).paginate(:page => params[:page], :per_page => 9)
    end

end
