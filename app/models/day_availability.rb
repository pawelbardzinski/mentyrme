class DayAvailability < ActiveRecord::Base

	belongs_to :profile
	has_and_belongs_to_many :time_slots
	has_and_belongs_to_many :availability_periods


	def get_availability_period_ids
		self.availability_periods.pluck(:id)
	end

	def get_time_slot_ids
		self.time_slots.pluck(:id)
	end
end
