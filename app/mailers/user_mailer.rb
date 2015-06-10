class UserMailer < ApplicationMailer
  def send_booking_request_to_mentor(booking)
    
    
    @booking = booking

    to_address = @booking.mentor.email
    from_address = "noreply@mentyrme.com"
    
    subject = "You have a new booking request"
    
    mail :to => to_address, :from => from_address, :subject => subject
  end
end
