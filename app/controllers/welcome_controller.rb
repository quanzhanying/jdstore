class WelcomeController < ApplicationController
  def index
   flash[:notice] = "Shopping is happy!"
 end
end
