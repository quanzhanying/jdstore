class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :category_id, presence: { message: "分類不得為空" }
  validates :title, presence: { message: "名稱不得為空" }
  validates :status, inclusion: { in: %w[on off], message: "商品狀態必須為on | off" }
  validates :quantity, numericality: { only_integer: true, message: "庫存必須為整數" }, if: proc { |product| !product.quantity.blank? }
  validates :quantity, presence: { message: "庫存不得為空" }
  validates :msrp, presence: { message: "MSRP不得為空" }
  validates :msrp, numericality: { message: "MSRP必須為數字" }, if: proc { |product| !product.msrp.blank? }
  validates :price, presence: { message: "價格不能為空" }
  validates :description, presence: { message: "描述不能為空"}

  belongs_to :category

  before_create :set_default_attrs #產品創建之前生成唯一uuid

  scope :onshelf, -> { where(status: Status::On) }

  has_many :product_images, -> { order(weight: 'desc') }, dependent: :destroy
  has_one :main_product_image, -> { order(weight: 'desc') }, class_name: :ProductImage

  acts_as_votable

  module Status
    On = 'on'
    Off = 'off'
  end

  private

    def set_default_attrs
      self.uuid = RandomCode.generate_product_uuid
    end

end
