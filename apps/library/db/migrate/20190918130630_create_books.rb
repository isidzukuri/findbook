class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :library_books do |t|
      t.string  :title, index: true
      t.text    :description
      t.string  :cover
      t.string  :domain, index: true
      t.string  :source, index: true

      t.string  :paper, limit: 500
      t.string  :txt
      t.string  :rtf
      t.string  :doc
      t.string  :pdf
      t.string  :fb2
      t.string  :ebup
      t.string  :mobi
      t.string  :djvu
      t.integer :genre_id, index: true
      t.string  :seo
      t.string :language
      t.string :optimized_cover
      t.boolean :hide
      t.boolean :is_copy, default: false, null: false
    end
    add_index :library_books, :seo, unique: true
  end
end
