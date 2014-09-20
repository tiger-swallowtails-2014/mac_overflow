class QuestionsController < ActionController::Base

	before_filter :load_user
	def index
		@question = @user.questions.new
		@questions = Question.all
	end


	def new
		@question = @user.questions.new
		# @question = Question.new
	end


	def create
		@question = @user.question.new(title: params[:question][:title], body: params[:question][:body])
		if @question.save
			redirect_to	root_path
		else
			@questions = Question.all
			render :index
		end
	end

	def show
		# @question = User.questions.find(params[:id])
	end

	def edit
		# @question = User.questions.find(params[:id])
		render :edit
	end

	def update
		# @question = Question.find(params[:id])
		@question = @user.questions.find(params[:id])
		if @question.update_attributes(question_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@question = Question.find(params[:id])
		p @question
		# @question = @user.questions.find(params[:question][:id])
		# @question.destroy
		redirect_to root_path
	end

	private
	def question_params
		params.require(:question).permit(:title, :body)
	end

	def load_user
		@user = User.find(params[:user_id])
	end
end