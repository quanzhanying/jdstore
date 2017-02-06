class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来购物"
  end
end
