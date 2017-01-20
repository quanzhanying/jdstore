class WelcomeController < ApplicationController
  def index
   flash[:notice] = "BE PATIENT!"
 end
end
