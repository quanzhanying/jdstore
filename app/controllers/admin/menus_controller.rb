class Admin::MenusController < ApplicationController

   def index
      @menu = Menu.all
   end

   def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to admin_menus_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :description, :quantity, :price)
  end
end
