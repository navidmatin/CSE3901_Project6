class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :amount, numericality: {greater_than_or_equal_to: 0.01}
end
