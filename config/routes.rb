Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/all_users', to: 'users#get_all_users'
      resources :users
      resources :claims
      resources :categories
      resources :clients
    end
  end
  root "arrivals#index"
end
