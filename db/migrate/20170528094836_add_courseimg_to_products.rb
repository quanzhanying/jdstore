class AddCourseimgToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :courseimg, :string
  end
end
