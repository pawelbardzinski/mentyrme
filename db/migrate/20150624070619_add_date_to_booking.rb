class AddDateToBooking < ActiveRecord::Migration
  def change
    add_column(:bookings, :booking_date, :datetime)
  end
end
