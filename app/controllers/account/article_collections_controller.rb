class Account::ArticleCollectionsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @article_collections = current_user.participated_articles
    @user_articles = current_user.articles
  end
end
