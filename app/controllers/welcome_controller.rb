class WelcomeController < ApplicationController

  # --CRUD--
  def index
<<<<<<< HEAD
    @products = Product.where(:category => ["收纳品", "装饰品"]).all.order("position ASC").paginate(:page => params[:page], :per_page => 12)
    @courses = Product.where(:category => "课程").all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
=======
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 12)
    @courses = Course.all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
>>>>>>> 469cb1bec4f50a4e5f2236f1d42ca410b17b5871
  end

end
