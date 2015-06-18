class DashboardController < ApplicationController

	before_action :authenticate_user!
	
	def index
    @categories = Category.all
	end
  
  def find_mentor
     @categories = Category.all
  end
  
  def my_sessions
    #@bookings = Booking.find_by(mentee, 9)
    
    id = current_user.id
    
    if current_user.is_mentor?  
      @bookings = Booking.where(:mentor_id=>id).all
    else
      @bookings = Booking.where(:mentee_id=>id).all
    end
    
    
    
    
  end
  
  def my_sessions_actions
    
    
    
    
  end
  
end
