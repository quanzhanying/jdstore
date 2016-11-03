class AddTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :Orders, :total, :integer, :default => 0
  end
end
