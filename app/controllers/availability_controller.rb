class AvailabilityController < ApplicationController

	before_action :authenticate_user!


	def edit
		@availability_periods = AvailabilityPeriod.all
		@time_slots = TimeSlot.all
		@current_availability = DayAvailability.includes(:time_slots, :availability_periods).where(profile_id: current_user.profile.id).order(:day_number)

	end


	def update
		days = DayAvailability.where(profile_id: current_user.profile.id).order(:day_number)
		params[:profile][:day_availabilities].each do |idx, data| 

			day = days.where(day_number: idx)
			unless day.empty?
				day.first.update_attributes({time_slot_ids: data[:time_slot_ids], availability_period_ids: data[:availability_period_ids]})
			end
		end

		redirect_to edit_profile_path
	end

end