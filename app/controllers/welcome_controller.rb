class WelcomeController < ApplicationController

  def index
    flash[:alert]= "alert"
    flash[:notice]= "notice"
    flash[:warning] ="warning"
  end
end
