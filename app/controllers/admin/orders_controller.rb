class Admin::OrdersController < ApplicationController

    before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

    def index
      @orders = Order.all
    end

    def show

    end

end
