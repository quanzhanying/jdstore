class Seller::ItemsController < ApplicationController

	before_action :authenticate_seller!
	before_action :get_params, only: [:edit, :update, :destroy]

	def index
		@items =
	end

	def show
		
	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end



	private

	def get_params
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :quantity, :price)
	end
end
