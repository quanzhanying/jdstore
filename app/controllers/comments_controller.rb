class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @product = Product.find(params[:product_id])
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(comment_params)
    @comment.product = @product
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: '成功发表评论'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), alert: "成功删除评论"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
