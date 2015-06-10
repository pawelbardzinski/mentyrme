class CreateDayAvailabilities < ActiveRecord::Migration
  def change
    create_table :day_availabilities do |t|
    	t.integer :day_number
    	t.integer :profile_id
    	t.integer :availability_period_id
      t.timestamps null: false
    end
  end
end
