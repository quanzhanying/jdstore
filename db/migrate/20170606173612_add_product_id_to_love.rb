class AddProductIdToLove < ActiveRecord::Migration[5.0]
  def change
    add_column :loves, :product_id, :integer
  end
end
