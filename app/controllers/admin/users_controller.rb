class Admin::UsersController < ApplicationController
  before_action :require_is_admin

  def index
    @users = User.all
  end


end
