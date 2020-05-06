class ApplicationController < ActionController::Base
	helper_method :current_user, :login!, :logged_in?, :logout!

	#sets the currently logged in user as a helper method
	def current_user
		#finds a user based on the user id saved in the session cookie
		@current_user ||= User.find(session[:user_id])
	end

	#login helper method
	def login!
		#sets session id as user found id
		session[:user_id] = @user.id
	end

	#clears the session
	def logout!
		session.clear
	end

	#checks to see if ia user is logged in
	def logged_in?
		#turns session id into a boolean value to be returned
		#first exclamation turns into a boolean value (which is the opposite)
		#second converts it to the actual boolean value
		!!session[:user_id]
	end
end
