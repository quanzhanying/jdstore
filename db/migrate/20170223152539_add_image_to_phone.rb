class AddImageToPhone < ActiveRecord::Migration[5.0]
  def change
    add_column :phones, :image, :string
  end
end
