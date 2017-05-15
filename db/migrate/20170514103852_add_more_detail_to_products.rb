class AddMoreDetailToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :salt, :integer, default: 5
    add_column :products, :sugar, :integer, default: 5
    add_column :products, :papper, :integer, default: 5
    add_column :products, :sauces,:integer, default: 10
    add_column :products, :vinegar,:integer, default: 10
    add_column :products, :oil,:integer, default: 10
  end
end
