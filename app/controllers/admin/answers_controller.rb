class Admin::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }


  end

  def create
    @answer = Answer.create(answer_params)

    if @answer.save
      redirect_to admin_answers_path,notice:"创建成功！"
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])


    if @answer.update(answer_params)
      redirect_to admin_answers_path
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:alert] = "answer Deleted"
    redirect_to admin_answers_path
  end
  private

  def answer_params
    params.require(:answer).permit(:true_answer, :description)
  end
end
