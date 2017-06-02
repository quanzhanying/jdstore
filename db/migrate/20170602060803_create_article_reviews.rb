class CreateArticleReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :article_reviews do |t|
      t.text :comment
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
