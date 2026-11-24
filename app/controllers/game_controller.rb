class GameController < ApplicationController
  before_action :set_score, :set_asked_ids, only: [:show, :process_answer]
  before_action :set_question, only: [:process_answer]

  def show
    category_names = @score.categories.split(", ")
    @asked_ids = params[:asked_ids].to_s.split(",")

    @question = Question
      .joins(:category)
      .where(categories: { name: category_names })
      .joins(:difficulty)
      .where(difficulty_id: @score.difficulty_id)
      .where.not(id: @asked_ids)
      .order("RAND()")
      .first

      if @question.nil?
        redirect_to scores_path
      end
  end

  def process_answer
    correct_index = (@question.correct_answer - 1).to_s
    tokens_saved = params[:bets][correct_index].to_i

    if tokens_saved == 0
      @score.update(remaining_tokens: @score.remaining_tokens)
      redirect_to scores_path
    else
      @score.update(
        remaining_tokens: tokens_saved,
        correct_answers_count: @score.correct_answers_count + 1
      )
      @asked_ids << @question.id.to_s

      redirect_to game_path(score_id: @score.id, asked_ids: @asked_ids.join(","))
    end
  end

  private
  def set_score
    @score = Score.find(params[:score_id])
  end

  def set_asked_ids
    @asked_ids = params[:asked_ids].to_s.split(",")
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
