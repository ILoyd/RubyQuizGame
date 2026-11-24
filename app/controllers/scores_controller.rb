class ScoresController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @scores = Score.includes(:difficulty).order("#{sort_column} #{sort_direction}")

    if params[:search].present?
      @scores = @scores.where("name LIKE ?", "%#{params[:search]}%")
    end

    @scores = @scores.page(params[:page]).per(5)
  end

  def create
    @score = Score.new(score_params)
    @score.categories = params[:score][:categories].reject(&:blank?).join(", ")

    if @score.save
      redirect_to game_path(score_id: @score.id)
    else
      @categories = Category.joins(:questions).distinct
      @difficulties = Difficulty.joins(:questions).distinct
      render 'home/index', status: :unprocessable_entity
    end
  end

  private
  def score_params
    params.require(:score).permit(:name, :difficulty_id)
  end

  def sort_column
    %w[difficulty_id correct_answers_count remaining_tokens created_at].include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
