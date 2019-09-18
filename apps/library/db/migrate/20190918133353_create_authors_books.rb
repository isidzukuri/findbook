# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :library_authors_books do |t|
      t.references :author, null: false
      t.references :book, null: false
    end
    add_index :library_authors_books, %i[author_id book_id], unique: true
  end
end
