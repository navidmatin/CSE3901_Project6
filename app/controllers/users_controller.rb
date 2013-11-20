class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def register
		@user = User.new(params[:user])
		if @user.save
			redirect_to controller: 'public', action: 'index'
		else
			redirect_to controller: 'public', action: 'register'
		end
	end

	def login
		@user = User.find_by_username(params[:user][:username])
		if @user == nil
			flash[:alert] = "User does not exist. Check your spelling."
			redirect_to controller: 'public', action: 'login'
		elsif @user.rank
			redirect_to controller: 'events', action: 'index'
		else
			redirect_to controller: 'public', action: 'index'
		end
	end
end
