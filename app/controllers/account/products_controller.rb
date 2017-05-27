class Account::ProductsController < ApplicationController
  before_action :authenticate_user!

  def mybentos
    @orders =current_user.orders.order("id DESC")
  end
end
