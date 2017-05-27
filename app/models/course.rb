class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :course_banner, ImageUploader
  mount_uploader :author_img, ImageUploader
  acts_as_list

  validates :course_banner, presence: true
end
