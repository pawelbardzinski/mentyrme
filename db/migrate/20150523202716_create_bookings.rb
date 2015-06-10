class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :title
      t.text :description
      t.string :location
      t.boolean :online_meeting
      t.integer :category_id
      t.integer :mentor_id
      t.integer :mentee_id

      t.timestamps null: false
    end
    
    create_table :bookings_tags, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :booking, index: true
    end
  end
end
