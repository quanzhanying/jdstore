class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello ladies/gentlemen! "
  end
end
