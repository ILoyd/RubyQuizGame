class GameController < ApplicationController
  def show
    @question_number = 1
    @question = Question.includes(:category, :difficulty).all.sample
    @score = Score.new(remaining_tokens: 1000)
    @bets = [0, 0, 0, 0]
  end

  def process_answer
    puts params[:bets].inspect
    redirect_back fallback_location: root_path
  end
end
