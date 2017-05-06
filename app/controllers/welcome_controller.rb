class WelcomeController < ApplicationController
	def index
		flash[:notice] = "晚上好"

		flash[:alert] = "晚上好"

		flash[:warning] = "晚上好"


	end

end
