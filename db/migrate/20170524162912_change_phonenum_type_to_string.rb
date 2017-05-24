class ChangePhonenumTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :phonenum, :string
  end
end
