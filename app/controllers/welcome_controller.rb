class WelcomeController < ApplicationController
  def index
    @products = Product.order("id DESC").limit(4)
    @products2 = Product.order("id DESC").limit(4).offset(4)
  end
end
