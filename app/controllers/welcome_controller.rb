class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Goodbye Loser"
  end
end
