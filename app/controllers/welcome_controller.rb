class WelcomeController < ApplicationController
  def index
    flash[:notice] = "jdstore欢迎您"
  end 
end
