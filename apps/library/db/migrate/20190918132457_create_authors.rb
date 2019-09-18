# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :library_authors do |t|
      t.string  :full_name, index: true
      t.string  :last_name, index: true
      t.string  :first_name
      t.string  :seo
      t.string  :uk
      t.boolean :hide
    end
    add_index :library_authors, :seo, unique: true
  end
end
