class AddAddressToJob < ActiveRecord::Migration[5.0]
  def change
    # ＃工作地點
    add_column :products, :address, :string

    # ＃需要用到的經緯度欄位
    add_column :products, :latitude, :float
    add_column :products, :longitude, :float
  end
end
