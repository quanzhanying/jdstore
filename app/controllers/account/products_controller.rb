class Account::ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = current_user.products.order("create_at DESC")
  end
end
