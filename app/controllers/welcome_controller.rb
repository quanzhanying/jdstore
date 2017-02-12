class WelcomeController < ApplicationController
  def index
   flash[:notice] = "欢迎来匠淘！"
  end
end
