class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Have nice day! "
  end
end
