class ProductsController < ApplicationController

  def index
    @products = Product.all
    @all_products =  Hash.new
    @categoies = ProductCategory.all
    @products.each do |product|
         product_temps = @all_products[product.category]
         if product_temps.blank?
           product_temps = Array.new
           @all_products[product.category] = product_temps
         end
         product_temps.push(product)
    end

  end

  def show
    @product = Product.find(params[:id])
    @categoies = ProductCategory.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !@product.blank?
      if !current_cart.is_product_added?(@product)
          current_cart.add_product_to_cart(@product)
          flash[:notice] = "商品已添加到购物车"
      else
        flash[:warning] = "本商品已在购物车"
      end
    else
      flash[:warning] = "商品已下架"
    end
    redirect_to :back
  end

  def filter_by_category
    @category = ProductCategory.find(params[:id])
    @products = Product.where(:category => @category.name).all
    @categoies = ProductCategory.all
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
