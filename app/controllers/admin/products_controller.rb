class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!

<<<<<<< HEAD
  def index
    @products = Product.all
  end
=======

>>>>>>> devise
end
