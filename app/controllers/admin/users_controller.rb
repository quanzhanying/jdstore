class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  layout 'admin'

  def index
  @user = User.all
  # @resumes.job = @job
  #@resumes.user = current.user
end


end
