class AddUrlSlugToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :url_slug, :string
  end
end
