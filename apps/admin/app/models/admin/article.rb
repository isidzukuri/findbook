module Admin
  class Article < ApplicationRecord
    self.table_name = 'library_articles'

    enum status: [ :unpublished, :published ]

    validates :title, presence: true
    validates :seo, presence: true

  end
end
