class FixCartIdToCartItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :cart_items, :card_id, :cart_id
  end
end
