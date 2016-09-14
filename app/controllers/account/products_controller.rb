class Account::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.participated_products
  end
end
