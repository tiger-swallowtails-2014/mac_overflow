class ResponsesController < ApplicationController
	def new 
		p params 
		p "you made it new!"
		@response = Response.new 
		@answer = Answer.find(params[:answer_id])

		render partial: "new", locals: {response: @response}
	end

	def create 
		p params 
	end
end