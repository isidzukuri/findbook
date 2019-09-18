# frozen_string_literal: true

module Library
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
