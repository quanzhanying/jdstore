class ChangeTotalToFloatInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :total, :integer
  end
end
