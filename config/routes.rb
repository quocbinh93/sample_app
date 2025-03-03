Rails.application.routes.draw do
  # root "articles#index"
  root "static_pages#home"

  # Defines the root path route ("/")
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
end
