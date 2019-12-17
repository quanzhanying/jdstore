class Account::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @orders = current_user.orders("id DESC")
  end

end
