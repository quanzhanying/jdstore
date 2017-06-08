class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome to JDStore!"
  end
end
