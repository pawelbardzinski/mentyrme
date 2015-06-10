class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer	:user_id
    	t.string	:one_line_description
    	t.text		:expertise_description
    	t.text		:sales_pitch
    	t.string	:employer
    	t.string	:school
    	t.string	:languages
      t.timestamps null: false
    end
  end
end
