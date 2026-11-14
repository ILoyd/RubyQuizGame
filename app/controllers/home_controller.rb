class HomeController < ApplicationController
  def index
    @score = Score.new

    @difficulties = Difficulty.joins(:questions).distinct
    @categories = Category.joins(:questions).distinct
  end
end
