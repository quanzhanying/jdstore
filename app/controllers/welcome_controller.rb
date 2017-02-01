class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎使用jdstore！"
  end
end
