Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#destroy'
  post '/login', to: 'users#login'
  get '/validate', to: 'users#validate'

  resources :attractions

  get '/reviews', to: 'reviews#index'
  get '/reviews/:id', to: 'reviews#show'
  post '/reviews', to: 'reviews#create'
  get '/attraction_reviews/:id', to: 'reviews#attraction_reviews'

  get '/accessible_stations', to: 'accessible_stations#index'
  get '/accessible_stations/:id', to: 'accessible_stations#show'
  get '/stops', to: 'stops#index'
  get '/stops/:id', to: 'stops#show'

  get '/attraction_stations', to: 'nearby_stations#index'
  get '/attraction_stations/:id', to: 'nearby_stations#attraction_stations'

  post '/likes', to: 'likes#create'

end
