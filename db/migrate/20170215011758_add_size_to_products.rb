class AddSizeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :size, :string
  end
end
