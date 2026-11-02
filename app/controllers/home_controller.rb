class HomeController < ApplicationController
  def index
    @game_session = Score.new

    @difficulties = ["Könnyű", "Közepes", "Nehéz"]
    @categories = ["Kategória 1", "Kategória 2", "Összes"]
  end
end
