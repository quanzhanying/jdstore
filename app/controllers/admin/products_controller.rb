class Admin::ProductsController < ApplicationController
  def new
    @products = @Products.new
  end
  def index
    @products = @Products.all
  end
end
