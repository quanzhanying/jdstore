class Account::CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products=current_user.collected_products
  end




    



end
