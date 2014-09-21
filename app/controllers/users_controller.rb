class UsersController < ApplicationController

	def index
		p params
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			redirect_to new_user_path
		end
	end

	def new
		
	end


	private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
	
end
