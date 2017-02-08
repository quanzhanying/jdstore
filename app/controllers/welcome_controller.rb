class WelcomeController < ApplicationController
  def index
    flash[:notice] = "下午好！"
  end
end
