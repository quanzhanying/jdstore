class WelcomeController < ApplicationController
  def index
    flash[:notice] = "共同拥有幸福"
  end
end
