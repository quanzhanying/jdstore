# == Schema Information
#
# Table name: groupships
#
#  id         :integer          not null, primary key
#  product_id :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Groupship < ApplicationRecord
  belongs_to :product
  belongs_to :group
end
