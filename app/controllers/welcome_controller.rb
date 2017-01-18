class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！请问有什么要买吗？"
  end
end
