class WelcomeController < ApplicationController
  def index
    #flash[:notice] = "Good Morning"
    @chefs = Chef.published.where(chef_level_id: 1)
    @products = Product.published.specialed
  end

  def about
  end
  
end
