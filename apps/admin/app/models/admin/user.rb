# frozen_string_literal: true

module Admin
  class User < ApplicationRecord
    self.table_name = 'library_users'

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
end
