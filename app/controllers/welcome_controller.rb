class WelcomeController < ApplicationController
  def index
    # flash[:notice] = "早安！你好！"
    @products = Product.all
  end

end
