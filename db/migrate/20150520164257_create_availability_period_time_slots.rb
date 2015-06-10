class CreateAvailabilityPeriodTimeSlots < ActiveRecord::Migration
  def change
    create_table :availability_period_time_slots, id: false do |t|
    	t.belongs_to :availability_period
    	t.belongs_to :time_slot
    end
  end
end
