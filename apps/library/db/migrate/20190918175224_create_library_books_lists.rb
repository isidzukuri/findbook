# frozen_string_literal: true

class CreateLibraryBooksLists < ActiveRecord::Migration[6.0]
  def change
    create_table :library_books_lists do |t|
      t.references :list, null: false
      t.references :book, null: false
    end
    add_index :library_books_lists, %i[list_id book_id], unique: true
  end
end
