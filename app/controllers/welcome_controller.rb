class WelcomeController < ApplicationController

  def index
    flash[:notice] = "哈哈哈！"
  end
end
