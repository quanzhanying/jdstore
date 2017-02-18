class Account::FavorchefsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chefs = current_user.favor_chefs
  end
end
