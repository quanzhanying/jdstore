class Admin::FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"


  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to admin_foods_path
    else
      render :edit
    end
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to admin_foods_path
    else
      render :new
    end
  end


  def show
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:title, :description, :quantity, :price, :image)
  end
end
