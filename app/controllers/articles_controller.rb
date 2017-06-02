class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @articles = Article.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @userarticles = @article.user.articles.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @article_reviews = ArticleReview.where(article_id: @article.id).order("created_at DESC")
    @article_review = ArticleReview.new
    @article_hots = Article.where(:is_hidden => false).sort_by{|article| -article.article_reviews.count}    #重要功能写法，按数据要求排序

    if @article.is_hidden
      flash[:warning] = "这篇文章在审核中！不可查看！"
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to :back
      flash[:notice] = "文章已提交，待管理员审核后可发布"
    else
      render :new
    end
  end


  # ---article_collection 收藏文章---

  def join
    @article = Article.find(params[:id])

    if !current_user.is_article_member_of?(@article)
      current_user.join_article_collection!(@article)
    end
      redirect_to article_path(@article)
      flash[:notice] = "你已将 ''#{@article.title}'' 加入文章收藏"
  end

  def quit
    @article = Article.find(params[:id])

    if current_user.is_article_member_of?(@article)
      current_user.quit_article_collection!(@article)
    end
      redirect_to article_path(@article)
      flash[:notice] = "你已将 ''#{@article.title}'' 移除收藏"
  end



  private

  def article_params
    params.require(:article).permit(:image, :title, :description,:summary, :user_id)
  end

end
