class User < ActiveRecord::Base
	has_and_belongs_to_many :events
	validates :first_name, presence: true
	validates :last_name, presence: true
	validate :birthdate_is_in_the_past
	validates :username, presence: true, uniqueness: true
	validates :password, confirmation: true 

	def init
		self.rank = false
	end

	def birthdate_is_in_the_past
		errors.add(:birthdate, ' must be in the past') unless (birthdate.past?)
	end
end
