class Event < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :location, presence: true
	validate :event_date_is_in_future

	def event_date_is_in_future
		errors.add(:date, ' and time must be in the future') if (date.past?)
	end
end
