class ExamsController < ApplicationController

  def index
    @exams = Exam.all
  end


  def show
    @exam = Exam.find(params[:id])
  end


end
