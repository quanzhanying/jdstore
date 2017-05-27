class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @courses = Course.all.order("position ASC")
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
      redirect_to admin_courses_path
  end


  # ---后台排序按钮功能---

  def move_up
    @course = Course.find(params[:id])
    @course.move_higher
    redirect_to :bace
  end

  def move_down
    @course = Course.find(params[:id])
    @course.move_lower
    redirect_to :bace
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :image, :course_banner, :author_img, :author_title, :author_description)
  end


end
