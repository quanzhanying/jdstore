class Admin::ProductsController < ApplicationController
  before_action :authenticate_user! only: [:new, :create, :edit, :update, :destroy, :indext]


  def index
    @products = Product.all
  end






end
