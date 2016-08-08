class AddIsStoreToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_store, :boolean, default: false
  end
end
