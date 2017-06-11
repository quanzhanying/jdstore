class WelcomeController < ApplicationController
  layout "welcome"
  def index
    @suggests = Product.selling.random8
  end
end
