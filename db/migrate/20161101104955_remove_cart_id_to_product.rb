class RemoveCartIdToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :cart_id, :integer 
  end
end
