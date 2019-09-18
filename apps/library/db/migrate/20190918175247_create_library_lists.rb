class CreateLibraryLists < ActiveRecord::Migration[6.0]
  def change
    create_table :library_lists do |t|
        t.string  :title, index: true
        t.text    :description
        t.string  :cover
        t.string  :seo
        t.integer :user_id
        t.integer :status, default: 0
      end
      add_index :library_lists, :seo, unique: true
  end
end
