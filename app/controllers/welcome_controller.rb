class WelcomeController < ApplicationController

  # --CRUD--
  def index
    @products = Product.all.order("position ASC")
  end

end
