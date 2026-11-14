class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:category, :difficulty).all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end
  
  private
  def question_params
    params.required(:question).permit(:text, :answer1, :answer2, :answer3, :answer4, :correct_answer, :category_id, :difficulty_id)
  end
end