class AddImgUrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img_url, :string
  end
end
