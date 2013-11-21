class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def register
		@user = User.new
	end

	def login
	end

	def register_process
		@user = User.new(params[:user])
		if @user.save
			redirect_to controller: 'public', action: 'index'
		else
			render action: 'register'
		end
	end

	def login_process
		@user = User.authenticate(params[:user][:username], params[:user][:password])
		if !@user
			@user = User.new(username: params[:user][:username])
			flash[:notice] = 'Username or password is incorrect'
			render action: 'login'
		elsif @user.rank
			redirect_to controller: 'events', action: 'index'
		else
			redirect_to controller: 'public', action: 'index'
		end
	end
end
