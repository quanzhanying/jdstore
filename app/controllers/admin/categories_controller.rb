class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_category, only: [:show, :edit, :update, :destroy]

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
      redirect_to admin_categories_path, notice: "新建类别"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params[:id])
      redirect_to admin_categories_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def detroy
    @category = Category.find(params[:id])
    @category.destroy
    redirct_to admin_categories_path, alert: "已删除"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
