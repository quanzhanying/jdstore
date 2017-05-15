class Product < ApplicationRecord
   validates :salt, presence: true
   validates :sugar, presence: true
   validates :sauces, presence: true
   validates :vinegar, presence: true
   validates :papper, presence: true
   validates :oil, presence: true
   validates :salt, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负盐长什么样！"}
   validates :sugar, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负糖长什么样！"}
   validates :sauces, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负酱油长什么样！"}
   validates :vinegar, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负醋长什么样！我就知道副处。"}
   validates :papper, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负胡椒粉长什么样！"}
   validates :oil, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负油长什么样！我就知道富有。"}

  mount_uploader :image, ImageUploader
end
