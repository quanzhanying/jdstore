class RemoveWageField < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :wage_upper_bound
  	remove_column :products, :wage_lower_bound
  end
end
