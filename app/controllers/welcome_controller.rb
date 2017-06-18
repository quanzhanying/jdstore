class WelcomeController < ApplicationController
  def index
    flash[:notice] = "一步一步来，我要参加比赛！"
  end
end
