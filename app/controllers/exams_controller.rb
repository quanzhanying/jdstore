class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end


end
