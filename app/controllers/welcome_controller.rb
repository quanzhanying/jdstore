class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到黄金时代！"
  end
end
