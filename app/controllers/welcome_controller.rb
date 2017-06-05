class WelcomeController < ApplicationController
  # def index
  #   flash[:notice] = "Notice!"
  #   flash[:alert] = "Alert!"
  #   flash[:warning] = "Warning!"
  # end

  def index
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category1 = Product.where(:category_id => 1).order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category2 = Product.where(:category_id => 2).order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category3 = Product.where(:category_id => 3).order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category4 = Product.where(:category_id => 4).order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category5 = Product.where(:category_id => 5).order("position ASC").paginate(:page => params[:page], :per_page => 10)
    @products_category6 = Product.where(:category_id => 6).order("position ASC").paginate(:page => params[:page], :per_page => 10)
  end

end
