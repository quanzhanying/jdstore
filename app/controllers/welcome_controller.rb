class WelcomeController < ApplicationController
  def index
    flash[:notice] = "您好，欢迎光临，祝您购物愉快！"
  end
end
