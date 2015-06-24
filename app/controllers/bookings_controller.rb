require 'chronic'
class BookingsController < ApplicationController
  
  before_action :authenticate_user!
  layout "no_container", only: [:find_mentors_browse]
  def index
    @bookings = Booking.all
  end
  
  def delete_booking_session_vars
    session.delete(:is_booking_in_progress)
    session.delete(:tag_params)
    session.delete(:mentee_id)
    session.delete(:mentor_id)
    session.delete(:category_id)
    session.delete(:location)
    session.delete(:booking_date)
    
    
    #session.delete()
  end
  
  def find_mentor_basics

    @category = Category.find_by(url_slug: params[:category_url_slug])
		@current_tag_ids = []
    
    delete_booking_session_vars
    
    
    
  end
  
  def find_mentor_details   
    
    @category_name = Category.find(session[:category_id]).name
    tag_ids = Tag.find session[:tag_params]
    @tags = tag_ids
    @mentors = User.mentors
    
    if request.post? 
      session[:mentor_id] = params[:booking][:mentor_id]
      
      
      
    else
      
      
    end
    
    @mentor = User.find(session[:mentor_id])
    
      
    
      
      
      
    #@booking = Booking.find(session[:booking_id])
    #@booking.mentor_id = params[:mentor_id]
    
		#if @booking.update_attributes(update_booking_category_params) 
      
      
      
		#else
		#	format.html { render :back }
		#end
    
  end
  
  def find_mentors_browse
    if request.post? 
      session[:is_booking_in_progress] = 1
    
      tag_ids = Tag.find params[:bookings][:tag_ids]
      session[:tag_params] = params[:bookings][:tag_ids]
      
      session[:mentee_id] = current_user.id
      session[:category_id] =  params[:category_id]
    
      @category_name = Category.find(params[:category_id]).name
    else
      @category_name = Category.find(session[:category_id]).name
      tag_ids = Tag.find session[:tag_params]
    end
    
    @tags = tag_ids
    
    @mentors = User.mentors
    
    
  end
  
  def find_mentors_public_profile
    @booking = Booking.find(session[:booking_id])
    @mentor = User.find(params[:id])
    
    
    
  end
  
  
  
  def find_mentor_locations
    
    @location = session[:location]
    
    #@booking = Booking.find(session[:booking_id])
    
		#if @booking.update_attributes(update_booking_category_params) 
			
		#else
		#	format.html { render :back }
		#end
    
  end

  
  def find_mentor_review
    
    @category_name = Category.find(session[:category_id]).name
    tag_ids = Tag.find session[:tag_params]
    @tags = tag_ids
    
    
    @location = session[:location]
    
    
    t = Time.parse(session[:booking_date])
    t2 = t + 60*60 
     
    the_datetime = t.to_formatted_s(:long)   
    first_amPM = t.strftime("%p")
    second_time = t2.to_formatted_s(:time)    
    second_amPM = t2.strftime("%p")
    
    @datetime = the_datetime << first_amPM << " - " << second_time << second_amPM
    @mentor_cost = 69.00

    
  end
  
  def find_mentor_notes
    
    
    if request.post? 
      session[:location] =  params[:booking][:location]


      date_wanted = params[:booking][:custom_date] 
      start_time  = params[:booking][:custom_time].split(' – ')
      real_start_time = start_time.first

      if date_wanted == "Today" || date_wanted == "Tomorrow"
        text_date_string = date_wanted << " " <<  real_start_time
      else
        text_date_string = real_start_time << " " << date_wanted
      end
      
      real_ruby_date_time =  Chronic.parse(text_date_string)
      session[:booking_date] = real_ruby_date_time

      
    else
      @location = session[:location]
   
      
      
      
    end
    

    
  end
  
  
  
  def find_mentor_finalize
    @booking = Booking.new
    
    @category_name = Category.find(session[:category_id]).name
    tag_ids = Tag.find session[:tag_params]
    @booking.tags = tag_ids
    @booking.mentee_id = current_user.id
    @booking.mentor_id =  session[:mentor_id]
    @booking.category_id =  session[:category_id]
    
    
    session[:booking_date]
    session[:booking_date]
    
    
    @booking.save
    
    @mentors = User.mentors
    
		if @booking.save
      delete_booking_session_vars
      UserMailer.send_booking_request_to_mentor(@booking).deliver
      
		else
			format.html { render :back }
		end
    
  end
  
  
  
  def mentor_approve
    @booking = Booking.find(params[:booking][:id])
    @booking.transition_to_pending!
    @booking.transition_to_accepted!
    
    UserMailer.send_accepted_booking_to_mentee(@booking).deliver
    
    
  end
  def mentor_reject
    @booking = Booking.find(params[:booking][:id])
    @booking.transition_to_pending!
    @booking.transition_to_rejected!

  end
  
  def mentor_modification
    @booking = Booking.find(params[:booking][:id])
    @booking.transition_to_modification!
    
    
  end
  
  def mentee_modification_approve
    @booking = Booking.find(params[:booking][:id])
    @booking.transition_from_modification_to_accepted!

    
    
  end
  def mentee_modification_reject
    @booking = Booking.find(params[:booking][:id])
    @booking.transition_from_modification_to_accepted!


  end
  
  
  
  
  
	def update_booking_category_params
    params.require(:booking).permit(:id, :category_id, :title, :description, :mentor_id, :mentee_id, :location, :online_meeting, :booking_date)
  end

  def current_controller?(names)
    names.include?(current_controller)
  end
  
end
