class CartsController < ApplicationController
  def clean!
    cart_items.destroy_all
  end
end
