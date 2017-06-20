Rails.application.routes.draw do
  root   'static_pages#new'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create' 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post   '/',        to: 'microposts#create' 
  get    '/contacts', to: 'contacts#new'    
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :contacts, only: [:new, :create]
end