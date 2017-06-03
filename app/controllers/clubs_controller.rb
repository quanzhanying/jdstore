class ClubsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  # ---CRUD---

  def index
    @clubs = Club.all.order("created_at DESC")
    @club_review = ClubReview.new
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user

    if @club.save
      redirect_to clubs_path
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(club_params)
      redirect_to clubs_path
    else
      render :edit
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
      redirect_to clubs_path
  end


  # club_vote投票功能

  def upvote
    @club = Club.find(params[:id])

    if !current_user.is_club_member_of?(@club)
      current_user.join_club_vote!(@club)
    else
      flash[:notice] = "这篇帖子 你已经点过赞"
    end
    redirect_to clubs_path
  end


  # ---private---

  private

  def club_params
    params.require(:club).permit(:title, :description, :user_id)
  end

end
