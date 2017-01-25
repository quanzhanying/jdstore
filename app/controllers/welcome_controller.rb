class WelcomeController < ApplicationController
  def index
    flash[:notice] = "放假啦！"
  end
end
