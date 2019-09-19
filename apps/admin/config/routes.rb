# frozen_string_literal: true

Admin::Engine.routes.draw do
  root 'home#index'

  resources :articles
end
