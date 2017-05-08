class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
      def index
        @products = Product.all
      end

      def show
        @product = Product.find(params[:id])
      end

end
