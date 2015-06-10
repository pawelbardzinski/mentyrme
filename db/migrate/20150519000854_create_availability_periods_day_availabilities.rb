class CreateAvailabilityPeriodsDayAvailabilities < ActiveRecord::Migration
  def change
    create_table :availability_periods_day_availabilities, id: false do |t|
      t.belongs_to :day_availability
      t.belongs_to :availability_period
    end

    add_index :availability_periods_day_availabilities, [:day_availability_id, :availability_period_id], :unique => true, name: 'unique_availability_xref'
  end
end
