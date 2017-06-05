class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :province #省份
      t.string :city #城市
      t.string :district #区
      t.string :addr #街道地址
      t.string :phone #手机号码
      t.string :name #收件人姓名
      t.boolean :addr_default #默认地址
      t.timestamps
    end
  end
end
