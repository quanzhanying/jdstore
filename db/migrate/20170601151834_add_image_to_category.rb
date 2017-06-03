class AddImageToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :image, :string
  end
end
