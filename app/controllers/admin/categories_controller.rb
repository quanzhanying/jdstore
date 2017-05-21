class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  layout "admin"


  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: "新建类别"
      else
        render :new
      end
  end


  def update
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: "更新成功"
      else
        render :edit
      end
    end

  def destroy
    @category.delete
    redirect_to admin_categories_path,   alert: "delete"
    end


  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
