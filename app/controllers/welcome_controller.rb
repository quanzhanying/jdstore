class WelcomeController < ApplicationController
  def index
    @products = Product.all.order("updated_at DESC")
  end
end
