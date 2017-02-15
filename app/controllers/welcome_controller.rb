class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到小站"
  end
end
