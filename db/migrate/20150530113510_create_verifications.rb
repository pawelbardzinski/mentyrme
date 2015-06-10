class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
    	t.integer	:profile_id
    	t.integer :validation_id
    	t.integer	:verified_by_user_id
    	t.string	:validation_value
    	t.text		:note
      t.timestamps null: false
    end
  end
end
