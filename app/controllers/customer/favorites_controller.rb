class Customer::FavoritesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_params, only: [:addToFavorites, :removeFromFavorites]
	layout 'customer'

	def index
		@items = current_user.favorited_items
	end

	def addToFavorites
		current_user.favorited_items << @item

		redirect_to root_path
	end

	def removeFromFavorites
		current_user.favorited_items.delete(@item)

		redirect_to customer_favorites_path
	end

	private

	def get_params
		@item = Item.find(params[:id])
	end

end
