class AddAuthorToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_banner, :string
    add_column :courses, :author_img, :string
    add_column :courses, :author_title, :string
    add_column :courses, :author_description, :text
  end
end
