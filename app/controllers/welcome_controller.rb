class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Arigatou！"
  end
end
