class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安你好"
  end
end
