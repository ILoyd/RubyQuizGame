class ScoresController < ApplicationController
  def index
    @scores = [
      Score.new(id: 1, name: 'Alice', difficulty: 'Könnyű', remaining_tokens: 1000, categories: 'Összes', date: '2026.09.24 15:22:00'),
      Score.new(id: 2, name: 'Bob', difficulty: 'Nehéz', remaining_tokens: 0, categories: 'Kategória 1', date: '2026.09.26 17:32:00'),
      Score.new(id: 3, name: 'Charlie', difficulty: 'Közepes', remaining_tokens: 200, categories: 'Kategória 1, Kategória 2', date: '2026.10.21 08:13:00')
    ]
  end
end
