class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！你好99！"
  end
end
