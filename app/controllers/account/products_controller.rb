class Account::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_search
  def index
    @products = current_user.products.order("create_at DESC")
  end
end
