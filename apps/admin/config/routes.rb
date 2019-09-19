Admin::Engine.routes.draw do
  root 'home#index'

  resources :articles
end
