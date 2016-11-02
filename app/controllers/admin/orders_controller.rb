class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "sidebar"

  def index
    @orders = Order.all
  end
end
