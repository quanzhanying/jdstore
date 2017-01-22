class WelcomeController < ApplicationController
  def index
    flash[:alert] = 'hi!'
  end
end
