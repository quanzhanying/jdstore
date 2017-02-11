class WelcomeController < ApplicationController
  def index
  flash[:notice] = "Hi~"
  end
end
