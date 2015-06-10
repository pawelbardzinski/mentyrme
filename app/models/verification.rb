class Verification < ActiveRecord::Base

	def self.getValidationValue(verifications, validationId)
		verification = verifications.where(validation_id: validation.id)
		return verification.empty? ? nil : verification.first.value
	end
end
