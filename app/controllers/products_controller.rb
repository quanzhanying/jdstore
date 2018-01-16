class ProductsController < ApplicationController
  respond_to :js

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @comments = @product.comments.includes(:comment_pictures).includes(:user)
    if @comments.blank?
    #   @avg_function = 0
    #   @avg_design = 0
      @avg_experience = 0
    else
    #   @avg_function = @comments.average(:function).round(2)
    #   @avg_design = @comments.average(:design).round(2)
      @avg_experience = @comments.average(:experience).round(1).to_i
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
     current_cart.add_product_to_cart(@product)
     flash[:notice] = "你已成功将#{@product.title}加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
     end
     redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    type = params[:type]
    if type == "favorite"
    current_user.favorite_products << @product
    redirect_to :back
    elsif type == "unfavorite"
    current_user.favorite_products.delete(@product)
    redirect_to :back

    else
    redirect_to :back
    end
  end

  def reduce_quantity
    @product = Product.find(params[:id])
    if @product.purchase_quantity > 1
       @product.purchase_quantity -= 1
       @product.save
       # redirect_to :back
       respond_to do |format|
         format.js   { render :layout => false }
       end
    end
  end

  def add_quantity
    @product = Product.find(params[:id])
    if @product.purchase_quantity < @product.quantity
       @product.purchase_quantity +=1
       @product.save
      # redirect_to :back
       respond_to do |format|
         format.js   { render :layout => false }
       end
     end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      @product.quantity -= @product.purchase_quantity
      # @product.purchase_quantity += 1
      @product.save
    else
      # flash[:warning] = "不能重复加入商品"
      # redirect_to :back
    end
    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
    flash[:notice] = "商品已删除"
  end

end
