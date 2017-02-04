class WelcomeController < ApplicationController
	def index
		flash[:notice]="notice 1"
		flash[:alert]="alert 2"
		flash[:warning]="warning 3"
	end

end
