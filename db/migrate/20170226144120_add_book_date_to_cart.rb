class AddBookDateToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :book_date, :datetime
  end
end
