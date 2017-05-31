class Admin::ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  layout "admin"

  def index
    @categoies = ProductCategory.all.order(:created_at)
  end

  def new
    @category = ProductCategory.new
  end

  def create
    @category = ProductCategory.new(category_params)
    @category.save
    redirect_to admin_product_categories_path
  end

  def edit
    @category = ProductCategory.find(params[:id])
  end

  def update
    @category = ProductCategory.find(params[:id])
    @category.update(category_params)
    redirect_to admin_product_categories_path
  end

  def destroy
    @category = ProductCategory.find_by_id(params[:id])
    unless @category.blank?
      @products = Product.where(:category => @category.name).all
      unless  @products.blank?
        @products.destroy_all
      end
      @category.delete
    end
    redirect_to admin_product_categories_path
  end

  private
  def category_params
    params.require(:product_category).permit(:name)
  end

  def is_admin
    if !current_user.is_admin
      redirect_to root_path
    end
  end
end
