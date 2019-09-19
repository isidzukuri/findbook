# frozen_string_literal: true

module Admin
  class Book < ApplicationRecord
    self.table_name = 'library_books'

    has_and_belongs_to_many :authors

    validates :title, presence: true
    validates :seo, presence: true
    validates_uniqueness_of :seo
  end
end
