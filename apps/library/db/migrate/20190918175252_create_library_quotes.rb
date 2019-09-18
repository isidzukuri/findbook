# frozen_string_literal: true

class CreateLibraryQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :library_quotes do |t|
      t.text    :text
      t.integer :user_id, index: true
      t.integer :book_id, index: true
      t.boolean :hide
      t.string  :book_name
      t.string  :author_name
      t.timestamps null: false
    end
  end
end
