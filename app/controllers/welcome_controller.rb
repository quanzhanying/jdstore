class WelcomeController < ApplicationController

  # --CRUD--
  def index
    @products = Product.where(:category => ["收纳品", "装饰品"]).all.order("position ASC").paginate(:page => params[:page], :per_page => 12)
    @courses = Product.where(:category => "课程").all.order("position ASC").paginate(:page => params[:page], :per_page => 3)
    @articles = Article.where(:is_hidden => false).order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

end
