class AddSomeDetialToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :discount, :integer, default: 100
    add_column :products, :newproduct, :boolean, default: false
  end
end
