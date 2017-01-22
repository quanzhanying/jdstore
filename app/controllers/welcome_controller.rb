class WelcomeController < ApplicationController
  def index
    flash[:alert] = "Good Morning!"
  end
end
