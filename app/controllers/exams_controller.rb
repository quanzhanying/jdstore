class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = Exam.all

  end

  def show
    @exam = Exam.find(params[:id])
    @choice = Choice.new
  end

  def check_answer
   @exam = Exam.find(params[:id])
   redirect_to answers_path
  end



end
