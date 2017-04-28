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

  resources :lists do
    resources :items
  end

  resources :items do
    resources :stores
  end

end
