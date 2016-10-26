class ItemsController < ApplicationController


  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(job_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def updated
    @item = Item.find(params[:id])

    if @item.update(job.params)
      redirect_to jobs_path
    else
      render :edit
    end
  end


private
  def job_params
    params.require(:item).permit(:title, :description, :price, :storage, :is_available, :attachment)
  end

end
