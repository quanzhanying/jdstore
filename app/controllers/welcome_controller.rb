class WelcomeController < ApplicationController
  def  index
    flash[:notice]  =  "欢迎光顾！"
  end
end
