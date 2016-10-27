class WelcomeController < ApplicationController
	def index
		flash[:notice] = "Morning Sunshine!"
	end
end
