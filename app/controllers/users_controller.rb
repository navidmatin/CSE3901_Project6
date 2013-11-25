class UsersController < ApplicationController
	before_filter :save_login_state, only:  [:register, :login, :register_process, :login_process]
	before_filter :get_current_user

	def show
		@user = User.find(params[:id])
		@message = Message.new
	end

	def register
		@user = User.new
	end

	def login
	end

	def register_process
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
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
			session[:user_id] = @user.id
			redirect_to controller: 'events', action: 'index'
		else
			session[:user_id] = @user.id
			redirect_to controller: 'public', action: 'index'
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to controller: 'public', action: 'index'
	end

	def new_admin
		@username = User.find_by_username(params[:user][:username])
		if @username
			@username.rank = true
			@username.save
		else
			flash[:notice] = 'Username does not exist'
		end
		redirect_to controller: 'events', action: 'index'
	end

	def remove_admin
		@username = User.find(params[:user_id])
		@username.rank = false
		@username.save
		redirect_to controller: 'events', action: 'index'
	end
end