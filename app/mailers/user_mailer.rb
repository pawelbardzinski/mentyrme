class UserMailer < ApplicationMailer
  def send_booking_request_to_mentor(booking)
    
    
    @booking = booking

    to_address = @booking.mentor.email
    from_address = "noreply@mentyrme.com"
    
    subject = "You have a new booking request"
    
    mail :to => to_address, :from => from_address, :subject => subject
  end
  
  def send_accepted_booking_to_mentee(booking)
    
    
    @booking = booking

    to_address = @booking.mentee.email
    from_address = "noreply@mentyrme.com"
    
    
    
    subject = "Your Booking Request from #{@booking.mentor.full_name} has been accepted."
    
    mail :to => to_address, :from => from_address, :subject => subject
  end
  
end
