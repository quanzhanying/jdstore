class WelcomeController < ApplicationController
  layout "welcome"
  def index
    @suggests = Product.selling.random4
  end
end
