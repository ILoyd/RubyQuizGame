class Score < ApplicationRecord
    belongs_to :difficulty
    validates :name, :categories, presence: true

    before_create :set_remaining_tokens

    private
    def set_remaining_tokens
        self.remaining_tokens =
            case difficulty.name
            when 'Könnyű' then 500
            when 'Közepes' then 750
            when 'Nehéz' then 1000
            else 500
            end
    end
end
