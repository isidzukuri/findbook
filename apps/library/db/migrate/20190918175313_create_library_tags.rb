class CreateLibraryTags < ActiveRecord::Migration[6.0]
  def change
    create_table :library_tags do |t|
      t.string  :title
      t.string  :seo
      t.string  :uk
    end
    add_index :library_tags, :seo, unique: true
  end
end
