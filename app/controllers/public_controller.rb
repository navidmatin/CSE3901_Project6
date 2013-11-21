class PublicController < ApplicationController
	def index
		@events = Event.find(:all)
	end
end
