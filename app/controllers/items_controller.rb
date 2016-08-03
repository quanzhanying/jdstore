class ItemsController < ApplicationController


	def index
		@items = Item.all.order("created_at DESC")
	end

	def show
		
	end
	
end
