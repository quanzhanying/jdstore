class Account::FavoritesController < ApplicationController
  layout "navbarview"
  before_action :authenticate_user!

  def index
    @products = current_user.favorited_products
  end
end
