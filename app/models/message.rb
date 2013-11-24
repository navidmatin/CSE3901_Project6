class Message < ActiveRecord::Base
	belongs_to :user
	validates :author, presence: true
	validates :body, presence: true, length: 1..150
end
