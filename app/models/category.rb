class Category < ActiveRecord::Base

	has_many :tags
	has_many :skills
	
  #belongs_to :booking
  
end
