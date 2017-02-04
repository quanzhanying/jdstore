class WelcomeController < ApplicationController
    before_action :authenticate_user! , only: [:new]
  def index
    flash[:notice] = "welcome"

  end
end
