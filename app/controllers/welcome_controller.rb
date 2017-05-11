class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎登陆！"
  end
end
