class Admin::ProductsController < ApplicationController
before_action :authenticate_user!
before_action :admin_required
layout "admin"
  before_action :find_product, only: [:edit,   :destroy,:update,:show]
  def index
     @products = Product.all
    end
  def new
      @product = Product.new
   end
    def show
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path
      else
        render :new
      end
    end

    def edit
     end

     def destroy
       flash[:alert] = @product.title+" 已经被删除"
       @product.destroy
       redirect_to admin_products_path
     end

     def update
       if @product.update(product_params)
         redirect_to admin_products_path
       else
         render :edit
       end
     end


    private
    def find_product
          @product = Product.find(params[:id])
    end
    def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end
end
