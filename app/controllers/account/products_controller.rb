class Account::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.participated_products.recent.paginate(:page => params[:page], :per_page => 5)
  end
end
