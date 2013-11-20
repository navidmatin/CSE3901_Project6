class User < ActiveRecord::Base
	has_and_belongs_to_many :events

	def init
		self.rank = false
	end
end
