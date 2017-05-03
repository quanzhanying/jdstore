class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end
end
