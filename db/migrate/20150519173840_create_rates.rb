class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
    	t.string	:type
    	t.integer	:skill_id
    	t.decimal	:amount, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
