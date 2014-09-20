class QuestionsController < ApplicationController
  before_filter :get_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def create
  end

  def show
    @answers = @question.answers
    @answer = @question.answers.new
  end

  def update
  end

  def destroy
  end

  private

  def get_question
    @question = Question.find(params[:id])
  end

end
