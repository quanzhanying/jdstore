class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎使用JDSTORE"
  end
end
