class WelcomeController < ApplicationController
	def index
		flash[:notice]="学习啦！"
	end
end
