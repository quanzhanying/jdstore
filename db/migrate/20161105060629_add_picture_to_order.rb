class AddPictureToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders,:picture,:string
  end
end
