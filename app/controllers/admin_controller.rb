class AdminController < ApplicationController
  layout "admin"
  before_action :login_required
  before_action :admin_required

end
