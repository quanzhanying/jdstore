class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.boolean :A, default: false
      t.boolean :B, default: false
      t.boolean :C, default: false
      t.boolean :D, default: false
      t.boolean :E, default: false
      t.boolean :F, default: false

      t.timestamps
    end
  end
end
