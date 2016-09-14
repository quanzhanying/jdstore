class AddColumnProductIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :product_id, :string
  end
end
