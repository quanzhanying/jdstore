class Account::LovesController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.loved_products
  end

end
