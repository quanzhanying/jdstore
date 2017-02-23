class WelcomeController < ApplicationController
  def index
    flash[:notice] = '欢迎来到Jdstore购物天堂！'
end
end
