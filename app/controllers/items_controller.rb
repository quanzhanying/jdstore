class ItemsController < ApplicationController


	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		@item = Item.find(params[:id])
	end
	
end
