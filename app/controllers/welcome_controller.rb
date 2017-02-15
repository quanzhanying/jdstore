class WelcomeController < ApplicationController
  def index
    flash[:notice] = "晚安！北京！"
  end
end
