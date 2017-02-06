class WelcomeController < ApplicationController
  def index
    flash[:notice] = "没想到你那么厉害"
  end
end
