class MenusController < ApplicationController
   def index
      @menus = Menu.all
   end

   def show
      @menu = Menu.find(params[:id])
   end


end
