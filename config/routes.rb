Rails.application.routes.draw do
  # Auth signup/login
  # post '/signup', to: 'auth#signup'
  # post '/login', to: 'auth#login'
  # delete '/logout', to: 'auth#logout'

  # Optional: show current user
  # get '/me', to: 'users#show'

  # Users
  resources :users do
    member do
      get :recycling_summary
    end
  end

  # Recycling entries
  resources :recycling_entries

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end