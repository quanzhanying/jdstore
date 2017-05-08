class WelcomeController < ApplicationController
  def index
    flash[:notice] = "zaoan"
  end
end
