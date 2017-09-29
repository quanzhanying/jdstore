class Template < ApplicationRecord
  has_many :templatephotos
  accepts_nested_attributes_for :templatephotos

  has_attached_file :image, styles: { medium: "300x168.75>", thumb: "100x56.25>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
