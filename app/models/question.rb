class Question < ApplicationRecord
    belongs_to :category
    belongs_to :difficulty

    validates :text, :answer1, :answer2, :answer3, :answer4, :correct_answer, presence: true
    validates :correct_answer, inclusion: { in: 1..4 } 
end
