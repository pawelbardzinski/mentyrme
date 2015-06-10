class AddProfileIdToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :profile_id, :integer
  end
end
