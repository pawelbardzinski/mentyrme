class TimeSlot < ActiveRecord::Base

	has_and_belongs_to_many :day_availability
end
