class ScoresController < ApplicationController
  def index
    @scores = Score.includes(:difficulty).order(remaining_tokens: :desc)
  end
end
