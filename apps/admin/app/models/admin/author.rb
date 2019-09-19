# frozen_string_literal: true

module Admin
  class Author < ApplicationRecord
    self.table_name = 'library_authors'

    has_and_belongs_to_many :books

    validates :full_name, presence: true
    validates :seo, presence: true
    validates_uniqueness_of :seo
  end
end
