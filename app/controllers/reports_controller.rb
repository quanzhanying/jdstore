class ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @report= Report.new
  end

  def create
    @post = Post.find(params[:post_id])
    @report = Report.new(report_params)
    @report.post = @post
    @report.user = current_user

    if @report.save
      flash[:notice] = "成功提交履历"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :attachment)
  end
end
