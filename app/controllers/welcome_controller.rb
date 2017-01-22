class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！清晨的阳光！"
  end
end
