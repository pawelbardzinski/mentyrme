class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer :photoable_id
    	t.string	:photoable_type
    	t.string	:caption
      t.timestamps null: false
    end
  end
end
