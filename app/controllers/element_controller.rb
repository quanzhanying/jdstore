class ElementController < ApplicationController
   def index
      @elements = Element.all
   end

   def show
      @element = Element.find(params[:id])
   end
end
