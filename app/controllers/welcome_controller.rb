class WelcomeController < ApplicationController
  def index
    #@products = Product.all.paginate(:page => params[:page], :per_page =>8)
    @products_fruit = Product.where(:product_type => "进口水果", :hot => true).limit(6)
    @products_seafood = Product.where(:product_type => "进口水产", :hot => true).limit(6)
    @products_meat = Product.where(:product_type => "进口鲜肉", :hot => true).limit(6)
  end
end
