class Profile < ActiveRecord::Base

	belongs_to :user
	has_one :avatar, class_name: "Photo", as: :photoable, dependent: :destroy
	has_many :skills
	has_many :day_availabilities

	accepts_nested_attributes_for :avatar, :skills


	def self.build_new_profile
		profile = Profile.new
		return profile
	end

	def build_out_mentor_profile
		new_skill = Skill.new
		new_skill.rate = Rate.new
		self.skills << new_skill
		
		(0..6).each do |day_idx|
			self.day_availabilities << DayAvailability.new({day_number: day_idx})
		end
	end

	def has_an_avatar?
		!self.avatar.nil?
	end
end
