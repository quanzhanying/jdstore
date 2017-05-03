class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!


end
