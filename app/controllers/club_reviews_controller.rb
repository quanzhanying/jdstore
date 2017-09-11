class ClubReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club

  def new
    @club_review = ClubReview.new
  end

  def create
    @club_review = ClubReview.new(club_review_params)
    @club_review.user_id = current_user.id
    @club_review.club_id = @club.id

    if @club_review.save
      redirect_to :back
    else
      flash[:warning] = "你的评论没填写内容耶！"
      redirect_to :back
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def club_review_params
    params.require(:club_review).permit(:comment, :user_id, :club_id)
  end
end
