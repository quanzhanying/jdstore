class WelcomeController < ApplicationController
  def index
    flash[:notice] = '你好，我们开始吧！'
  end
end
