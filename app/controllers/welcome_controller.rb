class WelcomeController < ApplicationController
  def index
    flash[:alert] = "加油加油别放弃 "
  end
end
