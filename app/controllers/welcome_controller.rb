class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello everybody! "
  end
end
