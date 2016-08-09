# == Schema Information
#
# Table name: relationship_item_and_users
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RelationshipItemAndUser < ApplicationRecord
	belongs_to :item
	belongs_to :user
end
