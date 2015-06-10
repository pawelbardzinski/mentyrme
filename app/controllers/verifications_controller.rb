class VerificationsController < ApplicationController

	before_action :authenticate_user!

	def index
		@validations = Validation.order(:name)
		@verifications = Verification.where(profile_id: current_user.profile.id)
		@user_validation_ids = @verifications.pluck(:validation_id)
	end
end
