# == Schema Information
#
# Table name: delivery_addresses
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  phone      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeliveryAddress < ApplicationRecord
	belongs_to :user
	
end
