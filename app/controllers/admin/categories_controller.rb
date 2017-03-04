class Admin::CategoriesController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

private

  def category_params
    params.require(:category).permit(:name)
  end

end
