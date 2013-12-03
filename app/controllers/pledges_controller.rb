class PledgesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@event = Event.find(params[:pledge][:event_id])
		@pledge = @user.pledges.build(params[:pledge])
		if @pledge.save
			redirect_to @user
		else
			redirect_to @user
		end
	end
end
