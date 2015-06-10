class AddRoleToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :is_mentor, :boolean
  	add_column :users, :role, :integer, default: 0
  	
  end
end
