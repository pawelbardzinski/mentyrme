class CreateDayAvailabilitiesTimeSlots < ActiveRecord::Migration
  def change
  	create_table :day_availabilities_time_slots, id: false do |t|
      t.belongs_to :day_availability_id, index: true
      t.belongs_to :tile_slot_id, :part, index: true
    end

  end
end
