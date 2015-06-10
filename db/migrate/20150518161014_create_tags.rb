class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.integer		:category_id
    	t.string		:name
    	t.text			:description
      t.timestamps null: false
    end

    create_table :skills_tags, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :skill, index: true
    end
  end
end
