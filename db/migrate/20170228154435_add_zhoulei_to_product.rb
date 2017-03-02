class AddZhouleiToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :zhonglei, :string
  end
end
