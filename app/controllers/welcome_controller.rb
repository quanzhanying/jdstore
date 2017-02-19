class WelcomeController < ApplicationController
  def index
    #flash[:notice] = "Good Morning"
    @chefs = Chef.where(chef_level_id: 1)
  end
end
