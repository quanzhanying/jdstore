class Admin::ProductsController < ApplicationController

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      @product.user = current_user

      if @product.save!
        redirect_to admin_products_path
      else
        render :new
      end

    end

    def index
      @products = Product.all
    end

    def show
      @product = Product.find(params[:id])


    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])

      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])

      if @product.destroy
        redirect_to admin_products_path,alert: "the product is deleted"
      end
    end

    private

    def product_params
      params.require(:product).permit(:title, :description , :quantity, :image , :price , :is_hidden)

    end
end
