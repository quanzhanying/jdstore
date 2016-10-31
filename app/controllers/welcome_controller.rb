class WelcomeController < ApplicationController
  def index
    redirect_to welcome_path
  end

  def show
    redirect_to welcome_path
  end
end
