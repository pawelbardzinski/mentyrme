class CreateAvailabilityPeriods < ActiveRecord::Migration
  def change
    create_table :availability_periods do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
