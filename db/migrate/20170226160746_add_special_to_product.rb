class AddSpecialToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :special, :boolean, default: false
  end
end
