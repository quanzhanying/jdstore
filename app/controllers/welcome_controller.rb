class WelcomeController < ApplicationController
  def index
     @products=Product.all.order("position ASC")
  end
end
