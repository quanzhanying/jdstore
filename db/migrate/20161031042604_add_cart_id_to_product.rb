class AddCartIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cart_id, :integer 
  end
end
