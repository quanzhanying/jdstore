class AddImageToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :image, :string
  end
end
