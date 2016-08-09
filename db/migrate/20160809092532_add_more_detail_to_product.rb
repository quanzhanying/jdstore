class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :wage_upper_bound, :integer
    add_column :products, :wage_lower_bound, :integer
  end
end
