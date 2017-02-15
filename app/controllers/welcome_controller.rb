class WelcomeController < ApplicationController

  def index
    flash[:notice] = "welcome"

  end
end
