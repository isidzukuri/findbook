# frozen_string_literal: true

module Library
  class Book < ApplicationRecord
    VIEW_ATTRIBUTES = [:id, :title, :seo, :is_copy] + Format::AVAILABLE

    has_and_belongs_to_many :authors

    validates :title, presence: true
    validates :seo, presence: true
    validates_uniqueness_of :seo
  end
end
