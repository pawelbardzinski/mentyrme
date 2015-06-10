class AddStartEndTimesToAvailabilityPeriods < ActiveRecord::Migration
  def change
  	add_column :availability_periods, :start_time, :time
  	add_column :availability_periods, :end_time, :time
  end
end
