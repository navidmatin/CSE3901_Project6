class PublicController < ApplicationController
	before_filter :get_current_user
	def index
		@events = Event.find(:all)
	end
end
