class CreateCommentPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_pictures do |t|
      t.integer :comment_id
      t.string :picture

      t.timestamps
    end
  end
end
