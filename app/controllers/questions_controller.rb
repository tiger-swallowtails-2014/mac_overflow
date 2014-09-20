class QuestionsController < ActionController::Base

	before_filter :load_user
	def index
		@question = @user.questions.new
		@questions = Question.all
	end


	def new
		@question = @user.questions.new
	end


	def create
		@question = @user.questions.new(title: params[:question][:title], body: params[:question][:body])
		if @question.save
			redirect_to	user_question_path(@user, @question)
		else
			@questions = Question.all
			render :index
		end
	end

	def show
		@question = @user.questions.find(params[:id])
	end

	def edit
		@question = @user.questions.find(params[:id])
	end

	def update
		@question = @user.questions.find(params[:id])
		if @question.update_attributes(question_params)
			redirect_to user_question_path(@user, @question)
		else
			render :edit
		end
	end

	def destroy
		@question = @user.questions.find(params[:id]).destroy
		redirect_to user_questions_path(@user)
	end

	private
	def question_params
		params.require(:question).permit(:title, :body)
	end

	def load_user
		@user = User.find(params[:user_id])
	end
end
