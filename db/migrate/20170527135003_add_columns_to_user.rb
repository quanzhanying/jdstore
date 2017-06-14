class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column   :users,  :name,  :string     #  添加姓名栏位
    add_column   :users,  :address,  :string  #  添加地址栏位
    add_column   :users,  :phone,  :string    #  添加手机栏位
  end
end
