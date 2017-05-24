class ExamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @exam = Exam.find(params[:id])
  end


end
