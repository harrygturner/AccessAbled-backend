Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#destroy'

  resources :attractions, only: %i[index show destroy]

  get '/reviews', to: 'reviews#index'
  get '/reviews/:id', to: 'reviews#show'
  post '/reviews', to: 'reviews#create'
end
