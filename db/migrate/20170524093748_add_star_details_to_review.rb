class AddStarDetailsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :look, :integer
    add_column :reviews, :freshness, :integer
    add_column :reviews, :price, :integer
  end
end
