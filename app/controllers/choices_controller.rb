class ChoicesController < ApplicationController
  def index
    @choice = Choice.all
  end

  def create
    @choice = Choice.new(choice_params)
    @choice.user = current_user

    if @choice.save

      redirect_to choices_path
    else
      render "exams/show"
    end
  end


end
