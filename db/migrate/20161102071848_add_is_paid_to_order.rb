class AddIsPaidToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_paid, :boolean, defaulf: false
  end
end
