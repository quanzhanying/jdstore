class AddSthToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products,:title,:string
    add_column :products,:price,:string
    add_column :products,:category,:string
  end
end
