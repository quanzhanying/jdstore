class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
    @categories = Category.all.map { |c| [c.name, c.id] }

  end

  def show
    @exam = Exam.find(params[:id])
  end

  def edit
    @exam = Exam.find(params[:id])

  end

  def create
    @exam = Exam.create(exam_params)
    @exam.category_id = params[:category_id]
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
    params.require(:exam).permit(:name, :question, :answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6,:image)
  end


end
