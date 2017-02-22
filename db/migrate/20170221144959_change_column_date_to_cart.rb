class ChangeColumnDateToCart < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :book_date, :datetime
  end
end
