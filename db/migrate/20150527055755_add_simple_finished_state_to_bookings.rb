class AddSimpleFinishedStateToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :is_finalized, :boolean, default: false
  end
end
