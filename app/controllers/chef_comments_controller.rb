class ChefCommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @chef_comment = ChefComment.new
  end

  def create
    @chef_comment = ChefComment.create(chef_comment_params)
    @chef_comment.user = current_user
    chef = Chef.find(params[:chef_id])
    @chef_comment.chef = chef
    @chef_comment.save

    redirect_to :back
  end

  private
  def chef_comment_params
    params.require(:chef_comment).permit(:comment)
  end

end
