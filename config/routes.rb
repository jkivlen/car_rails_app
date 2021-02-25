Rails.application.routes.draw do
  
  get 'makes/new'
  get 'makes/create'
  get 'makes/index'
  get 'makes/show'
  get 'cars/new'
  get 'cars/create'
  get 'cars/index'
  get 'cars/show'
  get 'cars/edit'
  get 'cars/update'
  get 'cars/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end
