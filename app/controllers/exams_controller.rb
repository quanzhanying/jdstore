class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index

    @exams = Exam.all.paginate(:page => params[:page], :per_page => 5)
    @choice = Choice.new
    @choices = Choice.all
  end


  def show
    @exam = Exam.find(params[:id])
    @choice = Choice.new
    @choice.name = @exam.name
  end

  def check_answer
   @exam = Exam.find(params[:id])
   redirect_to answers_path
  end

  def exam_params
    params.require(:exam).permit(:name, :question, :answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6,
                                 :image, :countdown)
  end


end
