class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
    	t.integer	:category_id
    	t.text		:description
      t.timestamps null: false
    end
  end
end
