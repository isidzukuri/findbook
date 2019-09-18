# frozen_string_literal: true

class CreateLibraryBooksTags < ActiveRecord::Migration[6.0]
  def change
    create_table :library_books_tags do |t|
      t.references :tag, null: false
      t.references :book, null: false
    end
    add_index :library_books_tags, %i[tag_id book_id], unique: true
end
end
