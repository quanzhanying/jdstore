class WelcomeController < ApplicationController
  def index
    @products = Product.where(id: 21..24)
    @products2 = Product.where(id: 25..28)
  end
end
