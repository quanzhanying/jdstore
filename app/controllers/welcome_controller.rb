class WelcomeController < ApplicationController
  def indext
    flash[:notice] = "早安！你好！"
  end 
end
