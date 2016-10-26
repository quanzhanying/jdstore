# == Schema Information
#
# Table name: productions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Production < ApplicationRecord
end
