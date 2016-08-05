class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin

  layout 'admin'

  def index
    @users = User.all
  end
  
end
