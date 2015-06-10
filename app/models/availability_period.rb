class AvailabilityPeriod < ActiveRecord::Base

	has_and_belongs_to_many :day_availabilities
end
