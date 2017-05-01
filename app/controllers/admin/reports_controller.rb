class Admin::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

 layout 'admin'

 def index
   @post = Post.find(params[:post_id])
   @reports = @post.reports.order('created_at DESC')
 end

 def destroy
      @post = Post.find(params[:post_id])
      @report = @post.reports
      @report.destroy
      redirect_to admin_post_reports_path, notice:  "The report has been deleted."
   end

end
