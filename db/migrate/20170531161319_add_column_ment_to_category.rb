class AddColumnMentToCategory < ActiveRecord::Migration[5.0]
  def change
     add_column :menus, :category_id, :integer
     add_index :menus, :category_id
  end
end
