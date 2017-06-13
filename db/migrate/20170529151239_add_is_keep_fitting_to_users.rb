class AddIsKeepFittingToUsers < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :is_fitting, :boolean
  end
end
