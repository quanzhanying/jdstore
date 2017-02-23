class WelcomeController < ApplicationController
  def index
    flash[:notice] = "新年好！"
  end
end
