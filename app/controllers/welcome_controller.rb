class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎你"
  end
end
