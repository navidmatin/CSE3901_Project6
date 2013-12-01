class User < ActiveRecord::Base
	has_and_belongs_to_many :events
	has_many :messages
	has_many :pledges
	validates :first_name, presence: true
	validates :last_name, presence: true
	validate :birthdate_is_in_the_past
	validates :username, presence: true, uniqueness: true, format: {with: /^[a-zA-Z]+[a-zA-Z0-9]*_?[a-zA-Z0-9]+$/, message: ' is invalid'}, length: {in: 8..20}
	validates :password, confirmation: true, format: {with: /^[a-zA-Z0-9]*$/, message: ' must be alphanumeric'}, length: {in: 6..20}

	def init
		self.rank = false
	end

	def birthdate_is_in_the_past
		errors.add(:birthdate, ' must be in the past') unless (birthdate.past?)
	end

	def self.authenticate(username, login_password)
		user = User.find_by_username(username)
		if user && (login_password == user.password)
			return user	
		else
			return false
		end
	end

	def total_pledge
		pledges.to_a.sum {|pledge| pledge.amount}
	end
end
