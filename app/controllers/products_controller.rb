class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:favorite] == "yes"
      @products = current_user.products
    end
  end

  def show
    @product = Product.find(params[:id])
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

  def add_to_favorite
    @product = Product.find(params[:id])
    @product.users << current_user
    @product.save
    redirect_to :back, notice: "成功加入收藏!"
  end

  def quit_favorite
    @product = Product.find(params[:id])
    @product.users.delete(current_user)
    @product.save
    redirect_to :back, alert: "成功取消收藏!"
  end

  def search
     if @query_string.present?
       @products = search_params
     end
   end

   protected

   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
   end

   private

   def search_params
     Product.ransack({:title_or_description_cont => @query_string}).result(distinct: true)
   end
 end
