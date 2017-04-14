class FixProductNameInteger < ActiveRecord::Migration[5.0]
    def change
        change_column :product_lists, :product_name, :string
    end
end
