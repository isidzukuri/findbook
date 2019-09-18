# frozen_string_literal: true

class CreateLibraryArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :library_articles do |t|
      t.string  :title, index: true
      t.text    :description
      t.text    :text
      t.string  :cover
      t.string  :seo
      t.integer :user_id
      t.integer :status, default: 1
    end
    add_index :library_articles, :seo, unique: true
  end
end
