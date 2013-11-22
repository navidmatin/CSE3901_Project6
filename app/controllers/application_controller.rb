class ApplicationController < ActionController::Base
	protect_from_forgery

	def authenticate_user
		if session[:user_id]
			return true
		else
			redirect_to(controller: 'users', action: 'login')
			return false
		end
	end

	def save_login_state
		if session[:user_id]
			redirect_to controller: 'public', action: 'index'
			return false
		else
			return true
		end
	end

	def get_current_user
		if @logged_in = session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def authenticate_admin
		if session[:user_id]
			unless User.find(session[:user_id]).rank == true
				redirect_to(controller: 'public', action: 'index')
			end
		else
			redirect_to(controller: 'users', action: 'login')
		end
	end
end
