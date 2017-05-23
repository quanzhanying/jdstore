class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！该上班了！"
  end 
end
