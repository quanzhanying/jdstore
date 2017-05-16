class WelcomesController < ApplicationController

  def index
    flash[:notice] = "hello jdstore"
  end
end
