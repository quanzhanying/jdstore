class WelcomeController < ApplicationController
  def index
    flash[:notice] = "say hi!"
    flash[:alert] = "say hi!"
    flash[:warning] = "say hi!"
  end
end
