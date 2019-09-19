Rails.application.routes.draw do
  mount Library::Engine,  at: '/',      as: 'library'
  mount Admin::Engine,    at: '/admin', as: 'admin'
end
