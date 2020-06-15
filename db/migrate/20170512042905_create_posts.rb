class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
        t.string :title
        t.text   :description
        t.string :author
        t.string :source
        t.integer :category_id
        t.string :image

        t.timestamps
    end
  end
end
