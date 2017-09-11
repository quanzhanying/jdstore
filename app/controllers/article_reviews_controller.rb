class ArticleReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def new
    @article_review = ArticleReview.new
  end

  def create
    @article_review = ArticleReview.new(article_review_params)
    @article_review.user_id = current_user.id
    @article_review.article_id = @article.id

    if @article_review.save
      redirect_to @article
    else
      flash[:warning] = "你的评论没填写内容耶！"
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def article_review_params
    params.require(:article_review).permit(:comment, :user_id, :article_id)
  end

end
