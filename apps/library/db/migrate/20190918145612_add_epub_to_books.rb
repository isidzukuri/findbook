# frozen_string_literal: true

class AddEpubToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column(:library_books, :epub, :string)
  end
end
