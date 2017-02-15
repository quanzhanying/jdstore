class WelcomeController < ApplicationController
	def index
		flash["notice"] = "Hello Shanghai!"
	end
end
