class AddThreeDescrptionsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :parameter, :text
    add_column :products, :appearance, :text
    add_column :products, :interior, :text
  end
end
