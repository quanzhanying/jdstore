class CreateCourseLists < ActiveRecord::Migration[5.0]
  def change
    create_table :course_lists do |t|
        t.integer :course_order_id
        t.string  :course_name
        t.integer :course_price
        t.integer :quantity
      t.timestamps
    end
  end
end
