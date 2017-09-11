class AddTokenToCourseOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :course_orders, :token, :string
  end
end
