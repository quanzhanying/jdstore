class CoursesController < ApplicationController


  # ---CRUD---
  def index
    @courses = Course.all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @course = Course.find(params[:id])
  end

end
