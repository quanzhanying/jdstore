class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @exams = Exam.all
    @choice = Choice.new
    @choices = Choice.all
  end

  def new
    @exam = Exam.new
    @categories = Category.all.map { |c| [c.name, c.id] }
    @choice = Choice.new
  end

  def show
    @exam = Exam.find(params[:id])
    @exam.category_id = params[:category_id]
  end

  def edit
    @exam = Exam.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
    @choice = Choice.new
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

  private

  def exam_params
    params.require(:exam).permit(:name, :question, :answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6,
                                 :image, :countdown, :is_a1en,:is_b1en,:is_c1en,:is_d1en,:is_e1en,:is_f1en)
  end


end
