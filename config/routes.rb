Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :claims
      resources :user_managements
    end
  end
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/all_users', to: 'users#get_all_users'
      get '/claims_for_mobile', to: 'claims#index_for_mobile'
      get '/system_users', to: 'users#system_users'
      resources :users
      resources :categories
      resources :clients
    end
  end
  root "arrivals#index"
end
