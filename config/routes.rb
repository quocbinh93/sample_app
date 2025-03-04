Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit--no-test-framework'
  # root "articles#index"
  root "static_pages#home"

  # Defines the root path route ("/")
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get '/microposts', to: 'static_pages#home'
end
