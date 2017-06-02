class MenusController < ApplicationController
   def index
      @menus = menu.all
   end

   def show
      @menu = menu.find(params[:id])
   end

   
end
