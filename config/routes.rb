Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/all_users', to: 'users#get_all_users'
      get '/claims_for_mobile', to: 'claims#index_for_mobile'
      get '/system_users', to: 'users#system_users'
      get '/category_client_email', to: 'categories#category_client_email'
      get '/forgot-password', to: 'users#forgot_password'
      get '/claims-by-categories', to: 'users#claims_group_by_category_id'
      get '/claims-in-progress', to: 'users#claims_group_by_tags_in_progress'
      get '/claims-fixed', to: 'users#claims_group_by_tags_fixed'
      resources :claims
      resources :categories
      resources :user_managements
      resources :users
      resources :clients
    end
  end
  root "arrivals#index"
end
