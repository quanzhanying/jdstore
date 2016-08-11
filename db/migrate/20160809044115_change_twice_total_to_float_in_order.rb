class ChangeTwiceTotalToFloatInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :total, :float
  end
end
