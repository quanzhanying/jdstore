class AddPositionToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :position, :integer

    Course.order(:updated_at).each.with_index(1) do |course, index|
       course.update_column :position, index
     end
  end
end
