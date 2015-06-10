class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
    	t.time 		:start_time
    	t.time 		:end_time
      t.timestamps null: false
    end
  end
end
