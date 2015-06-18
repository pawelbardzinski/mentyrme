class Booking < ActiveRecord::Base
  include AASM
  
  has_and_belongs_to_many :tags
  
  belongs_to :mentor, :class_name => "User", :foreign_key => "mentor_id"
  belongs_to :mentee, :class_name => "User", :foreign_key => "mentee_id"
  
  belongs_to :category
  
  aasm do
    state :started, :initial => true
    state :pending
    state :accepted
    state :rejected
    state :modification

    event :transition_to_pending do
      transitions :from => :started, :to => :pending
    end

    event :transition_to_accepted do
      transitions :from => :pending, :to => :accepted
    end
    
    event :transition_to_rejected do
      transitions :from => :pending, :to => :rejected
    end
    
    event :transition_to_modification do
      transitions :from => :started, :to => :modification
    end
    
    event :transition_from_modification_to_accepted do
      transitions :from => :modification, :to => :accepted
    end
    
    event :transition_from_modification_to_rejected do
      transitions :from => :modification, :to => :rejected
    end
    
    
  end
  
  
  
end
