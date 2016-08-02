class ItemsController < ApplicationController

	def index
		flash[:notice] = "I program there for I am"
	end
end
