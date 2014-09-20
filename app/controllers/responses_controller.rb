class ResponsesController < ApplicationController

  def index
    @answer = Answer.find(params[:answer_id])
    @responses = @answer.responses
  end

  def new
    @answer = Answer.find(params[:answer_id])
    @response = @answer.responses.new
  end

end
