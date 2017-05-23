class Admin::SizesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @sizes = Size.all
  end
  def new
    @size = Size.new
  end
  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to admin_sizes_path
    else
      render :new
    end
  end
  def edit
    @size = Size.find(params[:id])
  end
  def update
    @size = Size.find(params[:id])
    if @size.update(size_params)
      redirect_to admin_sizes_path
    else
      render :edit
    end
  end
  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to admin_sizes_path
  end
  private
    def size_params
      params.require(:size).permit(:name)
    end
end
