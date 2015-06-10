class BookingsController < ApplicationController
  before_action :authenticate_user!
  layout "find_mentors_browse", only: [:find_mentors_browse]
  def index
    @bookings = Booking.all
  end
  
  def find_mentor_basics


    @category = Category.find_by(url_slug: params[:category_url_slug])
		@current_tag_ids = []
 
  end
  
  def find_mentor_details        
    @booking = Booking.find(session[:booking_id])
    @booking.mentor_id = params[:mentor_id]
    
		if @booking.update_attributes(update_booking_category_params) 
      
      
      
		else
			format.html { render :back }
		end
    
  end
  
  def find_mentors_browse
    @booking = Booking.new
    tag_ids = Tag.find params[:bookings][:tag_ids]
    @booking.tags = tag_ids
    @booking.mentee_id = current_user.id
    @booking.category_id =  params[:category_id]
    @booking.save
    session[:booking_id] = @booking.id
     
    @mentors = User.mentors
    
    
  end
  
  def find_mentors_public_profile
    @booking = Booking.find(session[:booking_id])
    @mentor = User.find(params[:id])
    
  end
  
  
  
  def find_mentor_locations
    @booking = Booking.find(session[:booking_id])
    
		if @booking.update_attributes(update_booking_category_params) 
			
		else
			format.html { render :back }
		end
    
  end

  
  def find_mentor_review
    @booking = Booking.find(session[:booking_id])
    @category = Category.find(@booking.category_id)
    
    if !params[:online_meeting].present?
      @booking.online_meeting = 0
    end
    
		if @booking.update_attributes(update_booking_category_params) 
			
      #session[:booking_id] = @booking.id
      
		else
			format.html { render :back }
		end
    
  end
    
  
  
  
  def find_mentor_finalize
    
    @booking = Booking.find(session[:booking_id])

		if @booking.update_attributes(update_booking_category_params) 
      session.delete(:booking_id)
      UserMailer.send_booking_request_to_mentor(@booking).deliver
      
		else
			format.html { render :back }
		end
    
  end
  
  
	def update_booking_category_params
    params.require(:booking).permit(:id, :category_id, :title, :description, :mentor_id, :mentee_id, :location, :online_meeting, :is_finalized)
  end

  def current_controller?(names)
    names.include?(current_controller)
  end
  
end
