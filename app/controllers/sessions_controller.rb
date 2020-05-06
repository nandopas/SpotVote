class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
			login!
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		logout!
		redirect_to root_path
	end

	private
		def session_params
			params.require(:user).permit(:username, :email, :password)
		end
end
