class ChangeStateToBookings < ActiveRecord::Migration
  def self.up
    remove_column :bookings, :is_finalized
    add_column :bookings, :aasm_state, :string, :default => 'started'
    
    Booking.all.each do |booking|
      booking.aasm_state = 'started'
      booking.save
    end
  end

  def self.down
    add_column :bookings, :is_finalized, :boolean, default: false
    remove_column :bookings, :aasm_state
  end
end
