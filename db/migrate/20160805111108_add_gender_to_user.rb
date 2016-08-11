class AddGenderToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :boolean, default: false

  end
end
