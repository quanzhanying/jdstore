class AddCourseIdToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :course_id, :integer
  end
end
