class AddTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :Orders, :total, :integer
    add_column :Orders, :total, :integer, :default => 0
  end
end
