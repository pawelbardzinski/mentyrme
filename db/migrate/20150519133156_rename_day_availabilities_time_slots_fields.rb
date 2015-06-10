class RenameDayAvailabilitiesTimeSlotsFields < ActiveRecord::Migration
  def change
  	rename_column :day_availabilities_time_slots, :tile_slot_id_id, :time_slot_id
  	rename_column :day_availabilities_time_slots, :day_availability_id_id, :day_availability_id
  end
end
