# frozen_string_literal: true

module Admin
  class Article < ApplicationRecord
    self.table_name = 'library_articles'

    enum status: %i[unpublished published]

    validates :title, presence: true
    validates :seo, presence: true
  end
end
