class AddYieldlyToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :yieldly, :string
  end
end
