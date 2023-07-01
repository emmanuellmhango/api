Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :claims
      resources :categories
      resources :clients
    end
  end
  root "arrivals#index"
end
