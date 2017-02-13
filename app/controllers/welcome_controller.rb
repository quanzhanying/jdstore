class WelcomeController < ApplicationController
  def index
    flash[:notice] = "测试1"
  end
end
