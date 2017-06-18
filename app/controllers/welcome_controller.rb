class WelcomeController < ApplicationController
  def index
    flash[:notice] = 'Hi！Welcome to JD Store！'
  end
end
