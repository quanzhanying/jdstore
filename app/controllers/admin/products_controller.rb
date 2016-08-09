class Admin::ProductsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
	before_filter :require_is_admin

	def index
		@products = Product.all
	end

	def show
		Product.find(params[:id])
	end

	def new
    @products = Products.new
  end

  def create
    @products = Products.new(products_params)

    if @products.save
      redirect_to admin_productss_path
    else
      render :new
    end
  end

  def edit
    @products = Products.find(params[:id])
  end

  def update
    @products = Products.find(params[:id])
    if @products.update(products_params)
      redirect_to admin_productss_path
    else
      render :edit
    end
  end

  def destroy
    @products = Products.find(params[:id])

    @products.destroy

    redirect_to admin_productss_path
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  private

  def products_params
    params.require(:products).permit(:title, :description)
  end

end
