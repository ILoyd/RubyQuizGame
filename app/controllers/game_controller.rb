class GameController < ApplicationController
  def show
    @question_number = 1
    @game_session = Score.new(remaining_tokens: 1000)
    @question = Question.new(text: 'Kérdés szövege', category: 'Kategória 1', answer1: 'Válasz 1', answer2: 'Válasz 2', answer3: 'Válasz 3', answer4: 'Válasz 4')
  end
end
