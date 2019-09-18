# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_918_145_612) do
  create_table 'library_authors', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'full_name'
    t.string 'last_name'
    t.string 'first_name'
    t.string 'seo'
    t.string 'uk'
    t.boolean 'hide'
    t.index ['full_name'], name: 'index_library_authors_on_full_name'
    t.index ['last_name'], name: 'index_library_authors_on_last_name'
    t.index ['seo'], name: 'index_library_authors_on_seo', unique: true
  end

  create_table 'library_authors_books', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'author_id', null: false
    t.bigint 'book_id', null: false
    t.index %w[author_id book_id], name: 'index_library_authors_books_on_author_id_and_book_id', unique: true
    t.index ['author_id'], name: 'index_library_authors_books_on_author_id'
    t.index ['book_id'], name: 'index_library_authors_books_on_book_id'
  end

  create_table 'library_books', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'cover'
    t.string 'domain'
    t.string 'source'
    t.string 'paper', limit: 500
    t.string 'txt'
    t.string 'rtf'
    t.string 'doc'
    t.string 'pdf'
    t.string 'fb2'
    t.string 'ebup'
    t.string 'mobi'
    t.string 'djvu'
    t.integer 'genre_id'
    t.string 'seo'
    t.string 'language'
    t.string 'optimized_cover'
    t.boolean 'hide'
    t.boolean 'is_copy', default: false, null: false
    t.string 'epub'
    t.index ['domain'], name: 'index_library_books_on_domain'
    t.index ['genre_id'], name: 'index_library_books_on_genre_id'
    t.index ['seo'], name: 'index_library_books_on_seo', unique: true
    t.index ['source'], name: 'index_library_books_on_source'
    t.index ['title'], name: 'index_library_books_on_title'
  end
end
