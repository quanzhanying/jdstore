class WelcomeController < ApplicationController
  # def index
  #   flash[:notice] = "Notice!"
  #   flash[:alert] = "Alert!"
  #   flash[:warning] = "Warning!"
  # end

  def index
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 8)
  end

end
