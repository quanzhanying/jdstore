class MenusController < ApplicationController
   def index
     if params[:category].blank?
       @menus = Menu.all
     else
       @category_id = Category.find_by(name: params[:category]).id
       @menus = Menu.where(:category_id => @category_id)
     end
   end

   def show
      @menu = Menu.find(params[:id])
   end


end
