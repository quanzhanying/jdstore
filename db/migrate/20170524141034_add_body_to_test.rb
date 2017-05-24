class AddBodyToTest < ActiveRecord::Migration[5.0]
    def change
        add_column :tests, :body, :string
    end
end
