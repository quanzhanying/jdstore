class AddIsSupplierToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_supplier, :boolean, default: false
  end
end
