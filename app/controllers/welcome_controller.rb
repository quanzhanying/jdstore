class WelcomeController < ApplicationController
  def index
    flash[:warning] = "hello!"
  end
end
