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

#api
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :show]

      resources :users, only: [:index, :create, :show, :update, :destroy] do
        post :activate, on: :collection
        resources :followers, only: [:index, :destroy]
        resources :followings, only: [:index, :destroy] do
          post :create, on: :member
        end
        resource :feed, only: [:show]
      end
      resources :microposts, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
