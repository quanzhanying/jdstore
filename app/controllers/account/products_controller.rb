class Account::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.collections
  end
end
