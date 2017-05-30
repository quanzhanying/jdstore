class Admin::ElementController < ApplicationController
   layout "admin"
   before_action :authenticate_user!
   before_action :admin_required

   def index
      @elements = Element.all
   end

   def new
      @element = Element.new
   end

   def edit
      @element = Element.find(params[:id])
   end

   def show
      @element = Element.find(params[:id])
   end

   def create
      @element = Element.new(element_params)
      if @element.save
         redirect_to elements_path
      else
         render :new
      end
   end

   def update
      @element = Element.find(params[:id])
      if @element.update(element_params)
         redirect_to elements_path, notice: 'Update Succeed!'
      else
         render :edit
      end
   end

   def destroy
      @element = Element.find(params[:id])
      @element.destroy
      redirect_to elements_path, alert: 'Element Deleted!'
   end

   private

   def element_params
      params.require(:element), permit(:title, :description, :element_id, :element_name)
   end


end
