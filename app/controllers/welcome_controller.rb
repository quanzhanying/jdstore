class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎进入!"
  end
end
