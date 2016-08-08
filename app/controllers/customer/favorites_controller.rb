class Customer::FavoritesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_params, only: [:addToFavorites, :removeFromFavorites]
	layout 'customer'

	def index
		@items = current_user.favorited_items
	end

	def addToFavorites
		current_user.favorited_items << @item
		flash[:notice] = @item.title + ' has been added to Favorites'
		redirect_to :back
	end

	def removeFromFavorites
		current_user.favorited_items.delete(@item)
		flash[:alert] = @item.title + ' has been Removed From Favorites'
		redirect_to :back
	end

	private

	def get_params
		@item = Item.find(params[:id])
	end

end
