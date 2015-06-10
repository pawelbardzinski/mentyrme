class Tag < ActiveRecord::Base

	belongs_to :category
	has_and_belongs_to_many :skills
  has_and_belongs_to_many :bookings
  
end
