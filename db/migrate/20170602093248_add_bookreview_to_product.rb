class AddBookreviewToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bookreview, :text
  end
end
