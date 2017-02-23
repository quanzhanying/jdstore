class AddBookDateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :book_date, :datetime
  end
end
