class AddMoreDetailToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :contact_email, :string
  end
end
