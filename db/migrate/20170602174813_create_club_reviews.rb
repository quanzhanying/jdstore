class CreateClubReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :club_reviews do |t|
      t.text :comment
      t.integer :club_id
      t.integer :user_id

      t.timestamps
    end
  end
end
