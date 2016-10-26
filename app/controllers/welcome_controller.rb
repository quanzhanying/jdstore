class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到京东！"
  end
end
