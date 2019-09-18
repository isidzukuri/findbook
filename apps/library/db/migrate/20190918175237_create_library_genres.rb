# frozen_string_literal: true

class CreateLibraryGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :library_genres do |t|
      t.string  :title
      t.string  :seo
    end
    add_index :library_genres, :seo, unique: true
  end
end
