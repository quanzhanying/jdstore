class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @exams = Exam.all
    # if params[:category].blank?
    #
    # else
    #   @category_id = Category.find_by(name: params[:category]).id
    #
    # end
    #
    # if params[:size].blank?
    #
    # else
    #   @size_id = Size.find_by(name: params[:size]).id
    #
    # end
  end

  def new
    @exam = Exam.new

  end

  def show
    @exam = Exam.find(params[:id])
  end

  def edit
    @exam = Exam.find(params[:id])

  end

  def create
    @exam = Exam.create(exam_params)
    if @exam.save
      redirect_to admin_exams_path,notice:"创建成功！"
    else
      render :new
    end
  end

  def update
    @exam = Exam.find(params[:id])


    if @exam.update(exam_params)
      redirect_to admin_exams_path
    else
      render :edit
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    flash[:alert] = "exam Deleted"
    redirect_to admin_exams_path
  end
  private

  def exam_params
    params.require(:exam).permit(:name, :question, :answer_1, :image)
  end


end
