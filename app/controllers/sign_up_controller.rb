class SignUpController < ApplicationController

	before_action :authenticate_user!, only: [:about_you, :add_skills, :verifications]
	before_action	:get_profile, only: [:about_you, :add_skills, :verifications]

	
	def user_type_selection

	end

	
	def sign_up_type_selection

	end

	
	def set_as_mentor
		current_user.set_as_mentor
		current_user.save

		redirect_to sign_up_select_skill_path
	end

	
	def select_skill_category
		@skill = current_user.profile.skills.first
		@skill.category = Category.new
		@categories = Category.includes(:tags).order(:name)
		@current_tag_ids = []
	end

	
	def about_you
		@profile.avatar = Photo.new
	end

	
	def select_availability
		@availability_periods = AvailabilityPeriod.all
		@time_slots = TimeSlot.all
		@current_availability = DayAvailability.includes(:time_slots, :availability_periods).where(profile_id: current_user.profile.id).order(:day_number)
	end


	protected

	def get_profile
		@profile = Profile.find(current_user.profile.id)
	end

end