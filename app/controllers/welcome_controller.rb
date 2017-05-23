class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Yes~"
  end
  
end
