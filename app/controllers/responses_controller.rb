class ResponsesController < ApplicationController

	def new
		@response = Response.new
		@answer = Answer.find(params[:answer_id])
		render partial: "new", locals: {response: @response}
	end

	def create
		@answer = Answer.find(params[:answer_id])
		@answer.responses << @response = Response.create(response_params)
		if current_user
			@response.update_attributes(user_id: current_user.id)
		end
		render partial: "show", locals: {response: @response}
	end

	 def destroy
    Response.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

	private
	def response_params
		params.require(:response).permit(:body)
	end
end
