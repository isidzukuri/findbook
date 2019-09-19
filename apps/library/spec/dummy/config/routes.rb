# frozen_string_literal: true

Rails.application.routes.draw do
  mount Library::Engine, at: '/', as: 'library'
end
