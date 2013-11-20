class PublicController < ApplicationController
	def index
		@events = Event.find(:all)
	end

	def login
	end

	def register
	end
end
