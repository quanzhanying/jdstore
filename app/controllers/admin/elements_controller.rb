class Admin::ElementsController < ApplicationController

      def index
         @elements = Element.all
      end

      def show
         @element = Element.find(params[:id])
      end

      def new
       @element = Element.new
     end

     def edit
        @element = Element.find(params[:id])
     end

     def create
       @element = Element.new(element_params)

       if @element.save
         redirect_to admin_elements_path
       else
         render :new
       end
     end

     private

     def element_params
       params.require(:element).permit(:title, :description, :quantity)
     end
   end

end
