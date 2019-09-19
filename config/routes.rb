Rails.application.routes.draw do
  mount Library::Engine, at: '/', as: 'library'
end
