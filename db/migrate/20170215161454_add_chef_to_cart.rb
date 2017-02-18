class AddChefToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :chef_id, :integer
  end
end
