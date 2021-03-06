class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @albums = @user.get_up_voted Album
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		login!
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation, :admin)
  	end
end
