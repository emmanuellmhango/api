Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :claims
      resources :categories
      resources :clients
    end
  end
  put '/api/v1/users', to: 'users#create'
  # post '/api/v1/users', to: 'users#create'
  # Defines the root path route ("/")
  root "arrivals#index"
end
