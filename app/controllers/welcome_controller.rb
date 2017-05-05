class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome to Blue Dragon Store"
  end
end
