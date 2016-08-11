class WelcomeController < ApplicationController
  def index
    flash[:noitce] = "早安"
  end
end
