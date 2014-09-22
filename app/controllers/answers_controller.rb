class AnswersController < ApplicationController
  before_filter :get_question, only: [:create, :update]

  def create
    @answer = @question.answers.create(answer_params)
    if current_user
      @answer.update_attributes(user_id: current_user.id)
    end
    redirect_to question_path(@question)
  end

  def update
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @votes = @answer.votes
    @votes.create()
    @answer.increment!(:votecount, by = 1)
    render json: @votes.size
  end

  def downvote
    @answer = Answer.find(params[:id])
    @votes = @answer.votes
    @votes.last.destroy
    @answer.decrement!(:votecount, by = 1)
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