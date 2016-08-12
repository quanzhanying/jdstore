class Account::ProductsController < ApplicationController
  def index
    @products = current_user.participated_products
  end
end
