class WelcomeController < ApplicationController

  def index
        @q = Product.ransack(params[:q])
  end

end
