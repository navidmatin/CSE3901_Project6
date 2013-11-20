class PublicController < ApplicationController
	def index
		@events = Event.find(:all)
	end

	def login
	end

	def register
		@user = User.new
	end
end
