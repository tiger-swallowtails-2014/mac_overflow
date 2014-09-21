class AnswersController < ApplicationController
  before_filter :get_question, only: [:create, :destroy, :update]

  def create
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def update
  end

  def destroy

  end

  def upvote
    p "clicked"
    p params
    @votes = Answer.find(params[:id]).votes
    @votes.create()
    render json: @votes.size
  end

  def downvote
    @votes = Answer.find(params[:id]).votes
    @votes.last.destroy
    render json: @votes.size
  end


  private

  def get_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end