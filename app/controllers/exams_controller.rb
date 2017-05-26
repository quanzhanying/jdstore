class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index

    @exams = Exam.all.paginate(:page => params[:page], :per_page => 1)
    @choice = Choice.new

  end

  def show
    @exam = Exam.find(params[:id])
    @choice = Choice.new
  end

  def check_answer
   @exam = Exam.find(params[:id])
   redirect_to answers_path
  end



  def a
     @exam = Exam.find(params[:id])
     @exam.a!
     redirect_to :back
  end
  def a1
     @exam = Exam.find(params[:id])
     @exam.a1!
     redirect_to :back
  end

  def b
     @exam = Exam.find(params[:id])
     @exam.b!
     redirect_to :back
  end
  def b1
     @exam = Exam.find(params[:id])
     @exam.b1!
     redirect_to :back
  end

  def c
     @exam = Exam.find(params[:id])
     @exam.c!
     redirect_to :back
  end
  def c1
     @exam = Exam.find(params[:id])
     @exam.c1!
     redirect_to :back
  end

  def d
     @exam = Exam.find(params[:id])
     @exam.d!
     redirect_to :back
  end
  def d1
     @exam = Exam.find(params[:id])
     @exam.d1!
     redirect_to :back
  end

  def e
     @exam = Exam.find(params[:id])
     @exam.e!
     redirect_to :back
  end
  def e1
     @exam = Exam.find(params[:id])
     @exam.e1!
     redirect_to :back
  end

  def f
     @exam = Exam.find(params[:id])
     @exam.f!
     redirect_to :back
  end
  def f1
     @exam = Exam.find(params[:id])
     @exam.f1!
     redirect_to :back
  end



end
