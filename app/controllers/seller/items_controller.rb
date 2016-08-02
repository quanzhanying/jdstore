class Seller::ItemsController < ApplicationController

	before_action :authenticate_seller!
	before_action :get_params, only: [:edit, :update, :destroy]
	layout 'seller'

	def index
		@items = current_seller.items.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.seller = current_seller

		if @item.save
			redirect_to seller_items_path, notice: "A New Item has been Created"
		else
			render :new
		end
	end

	def edit
	end

	def update
		
		if @item.update(item_params)
			redirect_to seller_items_path, notice: "A New Item has been Created"
		else
			render :edit
		end
	end

	def destroy
		@item.destroy
		redirect_to seller_items_path, alert: "The Item has been Deleted"
	end



	private

	def get_params
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :quantity, :price)
	end
end
