class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string #添加姓名
    add_column :users, :address, :string #添加地址
  end
end
