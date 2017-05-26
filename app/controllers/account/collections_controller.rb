class Account::CollectionsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @collections = current_user.participated_products
  end
end
