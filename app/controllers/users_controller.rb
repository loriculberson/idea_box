class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end



	

	private
	def user_params
		params.require(:user).permit(:username, :password, :role)
	end



end