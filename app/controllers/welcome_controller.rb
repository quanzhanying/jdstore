class WelcomeController < ApplicationController
  def index
    flash[:notice] = "您好！"
  end

end
