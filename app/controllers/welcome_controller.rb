class WelcomeController < ApplicationController
  def index
    flash[:notice]="welcome to JD"

  end
end
