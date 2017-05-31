class AddStarDetailsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :value, :integer
    add_column :reviews, :risk, :integer
    add_column :reviews, :furtue, :integer
  end
end
