class UsersController < ApplicationController

	def index
		@users = User.all.order(created_at: :desc)
	end

	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the site!"
			session[:user_id] = @user.id
			redirect_to questions_path
		else
			flash[:alert] = "There was a problem creating your account. Please try again."
			redirect_to '/'
		end
	end

	def edit
	end

	def update
		current_user.update_attributes(user_params)
		redirect_to user_path(current_user)
	end


	private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :about)
  end

end
