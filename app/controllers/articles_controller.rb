class ArticlesController < ApplicationController


  def index
    @articles = Article.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @userarticles = @article.user.articles.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @article_reviews = ArticleReview.where(article_id: @article.id).order("created_at DESC")
    @article_review = ArticleReview.new
  end

  def new

  end

  def create

  end

  private

  
end
