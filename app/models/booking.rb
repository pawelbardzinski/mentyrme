class Booking < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  belongs_to :mentor, :class_name => "User", :foreign_key => "mentor_id"
  belongs_to :mentee, :class_name => "User", :foreign_key => "mentee_id"
  
  belongs_to :category
  
end
