class WelcomeController < ApplicationController
  def index
    #flash[:notice] = "Good Morning"
    @chefs = Chef.published.where(chef_level_id: 1)
    @products = Product.published.where(style: "法国风味")
  end
end
