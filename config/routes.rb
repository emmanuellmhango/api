Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/all_users', to: 'users#get_all_users'
      # get '/all_claims', to: 'claims#get_all_claims'
      resources :users do
        resources :claims
      end
      resources :categories
      resources :clients
    end
  end
  root "arrivals#index"
end
