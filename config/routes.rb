Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
  get '/home' => 'application#home'
  post '/home' => 'selections#create'
  delete '/homme' => 'selections#delete'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users' => 'users#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'auth/facebook/callback'  => 'sessions#create_provider'
  get '/logout' => 'sessions#destroy'
  post '/selections/:id' => 'selections#update'

  resources :list_items, only: [:show, :edit, :update, :destroy]
  resources :selections

  resources :items

  resources :lists do
    resources :items
  end

  resources :lists do
    resources :list_items
  end

  resources :selections do
    resources :list_items, only: [:edit, :update, :destroy]
  end

end
