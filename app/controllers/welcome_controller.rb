class WelcomeController < ApplicationController
  def index
    flash[:notice] = "很高兴得到你的关注"
  end
end
