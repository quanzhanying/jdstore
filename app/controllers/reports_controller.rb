class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @reports = @post.reports.order('created_at DESC')
  end

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
      flash[:notice] = "成功提交"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy

       @report = Report.find(params[:id])
       @report.destroy
       redirect_to posts_path, notice:  "The report has been deleted."
    end

  private

  def report_params
    params.require(:report).permit(:content, :attachment)
  end
end
