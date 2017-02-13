class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你好！购物网站！"
  end
end
