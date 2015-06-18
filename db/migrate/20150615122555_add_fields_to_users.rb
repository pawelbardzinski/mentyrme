class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :wants_notifications, :boolean, default: false
  	add_column :users, :is_active, :boolean, default: true
  end
end
