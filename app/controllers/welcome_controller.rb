class WelcomeController < ApplicationController

  # --CRUD--
  def index
    @products = Product.all
  end

end
