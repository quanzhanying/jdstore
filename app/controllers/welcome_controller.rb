class WelcomeController < ApplicationController
  def index
    flash[:warning] = "Goodmorning早安你好"
  end
end
