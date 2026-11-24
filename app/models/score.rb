class Score < ApplicationRecord
    belongs_to :difficulty
    validates :name, :categories, presence: true
end
