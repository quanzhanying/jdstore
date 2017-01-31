class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome to JDstore!"
  end


end
