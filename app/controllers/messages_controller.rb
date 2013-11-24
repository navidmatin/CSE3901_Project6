class MessagesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@message = @user.messages.build(params[:message])
		if @message.save
			redirect_to @user
		else
			flash[:notice] = 'Please fill in all fields'
			redirect_to @user
		end
	end
end
