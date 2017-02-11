class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到这里"
  end
end
