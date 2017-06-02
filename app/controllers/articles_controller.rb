class ArticlesController < ApplicationController


  def index
    @articles = Article.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @userarticles = @article.user.articles.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end
end
