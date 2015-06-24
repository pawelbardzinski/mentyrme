class AvailabilityPeriod < ActiveRecord::Base

	has_and_belongs_to_many :day_availabilities


	def self.custom_availability_period
		AvailabilityPeriod.find_by(name: 'Custom')
	end 
end
