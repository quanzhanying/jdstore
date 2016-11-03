class UpdateUserDeliveryInfo < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :name
  	remove_column :users, :address
  end
end
