module Library
  class Author < ApplicationRecord
    has_and_belongs_to_many :books

    validates :full_name, presence: true
    validates :seo, presence: true
    validates_uniqueness_of :seo
  end
end
