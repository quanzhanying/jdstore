class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    if params[:category].blank?
      @exams = Exam.all.recent
    else
      @category_id = Category.find_by(name: params[:category]).id
      @exams = exam.where(category_id: @category_id).recent
    end
  end

  def show
    @exam = Exam.find(params[:id])
    @photos = @exam.photos.all
  end

  def new
    @exam = Exam.new
    @categories = Category.all.map { |c| [c.name, c.id] }
    @photo = @exam.photos.build
  end

  def edit
    @exam = Exam.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @exam = Exam.create(exam_params)
    @exam.category_id = params[:category_id]
    if @exam.save
      if params[:photos] != nil
        params[:photos]['image'].each do |a|
          @photo = @exam.photos.create(:image => a)
        end
      end
      redirect_to admin_exams_path,notice:"创建成功！"
    else
      render :new
    end
  end

  def update
    @exam = Exam.find(params[:id])
    @exam.category_id = params[:category_id]
    if params[:photos] != nil
      @exam.photos.destroy_all
      params[:photos]['image'].each do |a|
        @picture = @exam.photos.create(:image => a)
      end
      @exam.update(exam_params)
      redirect_to admin_exams_path,notice: "更新成功!"

    elsif @exam.update(exam_params)
      redirect_to admin_exams_path,notice: "更新成功!"
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

  private

  def exam_params
    params.require(:exam).permit(:name, :question, :answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6, :category_id, :size_id, :image)
  end
end
