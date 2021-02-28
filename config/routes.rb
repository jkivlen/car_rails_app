Rails.application.routes.draw do
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index' 


  get '/cars/expensive', to: 'cars#expensive', as: 'expensive_car'

  resources :cars

  resources :makes, only: [:new, :create, :index, :show] do
    resources :cars, only: [:new, :create, :index]
  end
end
