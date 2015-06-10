class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
    	t.string		:name
    	t.text			:description
    	t.string		:value_label
      t.timestamps null: false
    end
  end
end
