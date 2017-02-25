class AddOwnerToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :owner, :string
  end
end
