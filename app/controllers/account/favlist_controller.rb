class Account::FavlistController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:notice] = "test"

  end
end
