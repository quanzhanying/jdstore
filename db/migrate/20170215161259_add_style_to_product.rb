class AddStyleToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :style, :string
  end
end
