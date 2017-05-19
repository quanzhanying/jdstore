class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "category 新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @catefory.update(category_params)
      redirect_to categories_path, notice: "category 修改成功"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: "category 已经删除"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
