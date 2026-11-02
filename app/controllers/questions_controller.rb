class QuestionsController < ApplicationController
  def index
    @questions = [
      Question.new(id: 1, text: 'Kérdés1', answer1: 'Válasz11', answer2: 'Válasz12', answer3: 'Válasz13', answer4: 'Válasz14', correct_answer: 1, category: 'Kategória 1', difficulty: 'Könnyű'),
      Question.new(id: 2, text: 'Kérdés2', answer1: 'Válasz21', answer2: 'Válasz22', answer3: 'Válasz23', answer4: 'Válasz24', correct_answer: 4, category: 'Kategória 3', difficulty: 'Nehéz'),
      Question.new(id: 3, text: 'Kérdés3', answer1: 'Válasz31', answer2: 'Válasz32', answer3: 'Válasz33', answer4: 'Válasz34', correct_answer: 2, category: 'Kategória 2', difficulty: 'Közepes')
    ]
  end

  def edit
    @question = Question.new(id: params[:id], text: 'Kérdés szövege', answer1: 'Válasz1 szövege', answer2: 'Válasz2 szövege', answer3: 'Válasz3 szövege', answer4: 'Válasz4 szövege', correct_answer: 1, category: 'Kategória 1', difficulty: 'Könnyű')
    
    @difficulties = ["Könnyű", "Közepes", "Nehéz"]
    @categories = ["Kategória 1", "Kategória 2"]
  end
end
