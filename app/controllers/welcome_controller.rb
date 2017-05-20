class WelcomeController < ApplicationController
  def index
    flash[:notice] = "JDStore."
  end
end
