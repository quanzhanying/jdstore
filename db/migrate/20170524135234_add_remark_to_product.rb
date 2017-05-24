class AddRemarkToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :remark, :string
  end
end
