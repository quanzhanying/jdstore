class WelcomeController < ApplicationController

  def index
    flash[:warning] = "你好你好!!"
  end

end
