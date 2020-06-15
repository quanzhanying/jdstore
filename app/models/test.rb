class Test < ApplicationRecord
    # attr_accessible :body
    has_many :questions, dependent: :destroy
end
