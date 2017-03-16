class WelcomeController < ApplicationController
  def index
    flash[:notice] = "您好！早上好！"
  end
end
