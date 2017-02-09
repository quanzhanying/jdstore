class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！你好！欢迎来到新世界"

  end
end
