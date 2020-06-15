class Question < ApplicationRecord
    # attr_accessible :answer, :body, :test_id
    belongs_to :test
end
