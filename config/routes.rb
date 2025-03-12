Rails.application.routes.draw do
  get 'data_deletion/facebook_deletion'
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
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :settings
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  post '/auth/:provider/callback', to: 'sessions#create'
  resources :microposts do
    resources :comments do
      member do
        delete :destroy
      end
    end
    member do
      post :reply
    end
    resources :reactions, only: [:create, :destroy]
  end
  resources :comments do
    resources :reactions, only: [:create, :destroy]
  end
  resources :chat_rooms, only: [:index, :show, :create]
  get 'messages', to: 'chat_rooms#index'
  mount ActionCable.server => '/cable'
  resources :chat_rooms do
    resources :messages
  end
end
