class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎光临！"
  end
end
