class ProductsController < ApplicationController

  before_action :authenticate_user! , only: [:order]
  # 管理员自动跳转
  # before_action :admin_redirect

  def index
    # if current_user and current_user.admin?
    #   redirect_to '/admin/products'
    # end
    @products = Product.all
  end



  # def create
  #   @product = Product.new(product_params)

  #   if @product.save
  #     redirect_to products_path, notice: "新建成功"
  #   else
  #     render :new
  #   end
  # end

  # def new
  #   @product = Product.new
  # end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  def show
    @product = Product.find(params[:id])
  end

  # def update
  #   @product = Product.find(params[:id])

  #   if @product.update(product_params)
  #     redirect_to products_path,  notice: "更新成功"
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @product = Product.find(params[:id])

  #   @product.destroy
  #   redirect_to products_path

  # end

  # def order
    
  # end


    # puts '~~~'
    # puts product
    # puts '~~~'
    # p = Product.find(product.id)
    # if cart_items.where(product_id: p.id)
    #   puts 'haha'
    # else
    #   puts 'ohno'
    # end
    # # p.quantity = p.quantity + 1
    # # puts p.quantity
    # puts '~~~'


  def add_to_cart
    @product = Product.find(params[:id])
    # 首先判断是否产品库存为0，为0则直接重定向回去
    if @product.quantity == 0
      redirect_to :back
    else
      # 看是否购物车中添加过同类商品
      p_already = current_cart.cart_items.where(product_id: @product.id)
      # 如果有，直接在原产品上数量+1
      if p_already.present?
        flash[:notice] = "添加购物车成功！" 
        puts '~~ already have this product ~~'
        # 注意where查出来的是个collection
        if !p_already.first.num_increase
          flash[:notice] = "不能超过库存"
        end

      # 如果都没有就添加一项到产品里面去
      else
        puts '~~ have no this product ~~ '  
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "添加购物车成功！" 
      end    
      redirect_to :back
    end


  end


  private

  # def product_params
  #   params.require(:product).permit(:title, :description, :quantity, :price)
  # end

  def admin_redirect
    if current_user and current_user.admin?
      redirect_to admin_products_path
    end
  end




end
