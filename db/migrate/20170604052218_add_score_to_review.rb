class AddScoreToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :score, :integer, default: 0
  end
end
