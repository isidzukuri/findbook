# frozen_string_literal: true

module Admin
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
