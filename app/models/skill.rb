class Skill < ActiveRecord::Base

	belongs_to :profile
	belongs_to :category
	has_many :photos, as: :photoable, dependent: :destroy
	has_and_belongs_to_many :tags, dependent: :destroy
	has_one :rate, dependent: :destroy
	
	accepts_nested_attributes_for :category, :tags, :rate

		def get_category_name
			self.category.nil? ? "N/A" : self.category.name
		end
end
