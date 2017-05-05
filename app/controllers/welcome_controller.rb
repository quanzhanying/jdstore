class WelcomeController < ApplicationController
  def index
    @products = Product.all
  end
end
