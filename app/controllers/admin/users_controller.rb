class Admin::UsersController < ApplicationController
  before_action :require_is_admin
  layout "sidebar"
  def index
    @users = User.all
  end
end
