class SessionsController < ApplicationController

	def new
	end

	def create
  @user = User.authenticate(params[:username], params[:password])
  if @user
    flash[:notice] = "You've been logged in."
    session[:user_id] = @user.id
    redirect_to questions_path
  else
    flash[:alert] = "There was a problem logging you in."
    redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end

end
