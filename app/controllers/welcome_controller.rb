class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hi！想看看有什么好玩儿的么？"
  end
end
