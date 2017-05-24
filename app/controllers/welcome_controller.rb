class WelcomeController < ApplicationController
  def index
    @products = Product.all
  end

	private
end
