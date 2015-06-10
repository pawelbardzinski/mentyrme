class Skill < ActiveRecord::Base

	belongs_to :profile
	belongs_to :category
	has_many :photos, as: :photoable, dependent: :destroy
	has_and_belongs_to_many :tags
	has_one :rate
	
	accepts_nested_attributes_for :category, :tags, :rate
end
