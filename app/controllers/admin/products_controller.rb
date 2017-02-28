class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  def index
    @products=Product.all
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert]= "you're not admin!"
      redirect_to root_path
    end
  end

end
