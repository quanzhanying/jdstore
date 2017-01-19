class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end	

	def new
		@product = Product.new
	end
end
