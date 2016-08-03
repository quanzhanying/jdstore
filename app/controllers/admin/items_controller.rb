class Admin::ItemsController < ApplicationController

	before_action :authenticate_user!
	before_action :require_is_admin
	before_action :get_params, only: [:edit, :update, :destroy]
	layout 'admin'

	def index
		@items = current_user.items.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.user = current_user

		if @item.save
			redirect_to admin_items_path, notice: "A New Item has been Created"
		else
			render :new
		end
	end

	def edit
	end

	def update
		
		if @item.update(item_params)
			redirect_to admin_items_path, notice: "A New Item has been Created"
		else
			render :edit
		end
	end

	def destroy
		@item.destroy
		redirect_to admin_items_path, alert: "The Item has been Deleted"
	end



	private

	def get_params
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :quantity, :price, :image)
	end
end
