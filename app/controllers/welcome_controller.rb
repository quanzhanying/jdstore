class WelcomeController < ApplicationController
	def index
		flash[:notice] = "Hello again..."
	end
end
