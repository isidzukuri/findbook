module Library
  class Book < ApplicationRecord
    has_and_belongs_to_many :authors

    validates :title, presence: true
  end
end
