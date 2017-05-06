class WelcomeController < ApplicationController

  def index
    flash[:notice] = "good mroning"
  end

end
