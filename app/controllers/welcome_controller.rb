class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到JDstore!"
  end
end
