class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  before_action :require_is_admin

  def publish
    @item = Item.find(params[:id])
    @item.publish!
    redirect_to :back
  end

  def hide
    @item = Item.find(params[:id])
    @item.hide!
    redirect_to :back
  end


  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end


  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :storage, :price, :attachment)
  end

end
