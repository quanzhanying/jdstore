class AnswersController < ApplicationController
  before_action :authenticate_user!
  def index
    @answers = Answer.all

  end

  def show
    @answer = Answer.find(params[:id])

  end

end
