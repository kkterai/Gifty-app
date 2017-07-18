Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
  get '/home' => 'application#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users' => 'users#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'auth/facebook/callback'  => 'sessions#create_provider'
  get '/logout' => 'sessions#destroy'

  post '/home' => 'selections#create'
  delete '/selections/:id' => 'selections#destroy'
  patch '/selections/:id' => 'selections#update'


  resources :list_items, only: [:show,:update, :destroy]

  resources :lists do
   resources :items, only: [:create]
  end

  resources :lists, only: [:show] do
    resources :list_items, only: [:show, :edit, :update, :destroy]
  end

  resources :selections, only: [:show] do
    resources :list_items, only: [:show]
  end

end
