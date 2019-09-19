# frozen_string_literal: true

Admin::Engine.routes.draw do
  root 'home#index'

  devise_for :users, class_name: "Admin::User", module: :devise

  resources :articles
end
