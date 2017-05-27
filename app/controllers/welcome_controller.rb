class WelcomeController < ApplicationController

  # --CRUD--
  def index
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 12)
    @courses = Course.all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
  end

end
