class Difficulty < ApplicationRecord
    has_many :questions
    has_many :scores
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
