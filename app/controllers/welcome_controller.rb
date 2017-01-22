class WelcomeController < ApplicationController
  def index
    flash[:notice] = "吴雨墨！"
  end
end
