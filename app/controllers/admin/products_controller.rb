class Admin::ProductsController < ApplicationController

    def index
      @products=Product.all
      # @product.user=current_user
    end

    def new
      @product=Product.new
      @product.user=current_user

    end

    def create
      @product=Product.new(params_product)
      @product.user=current_user
      if @product.save
        redirect_to admin_products_path
      else
        render :new
      end
    end

    def edit
      @product=Product.find(params[:id])
    end

    def update
      if @product=Product.update(params_product)
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
      @product=Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path
    end

    private

    def params_product
      params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end


end
