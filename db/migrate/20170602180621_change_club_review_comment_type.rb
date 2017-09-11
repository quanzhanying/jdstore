class ChangeClubReviewCommentType < ActiveRecord::Migration[5.0]
  def change
    change_column :club_reviews, :comment, :string
  end
end
