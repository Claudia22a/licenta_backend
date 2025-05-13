Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users,
  only: [],
  path: "",
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  },
  defaults: { format: :json }

  get "/current_user", to: "users/users#current"

  as :user do
    post "login", to: "users/sessions#create"
    delete "logout", to: "users/sessions#destroy"
    post "signup", to: "users/registrations#create"
  end

  namespace :api do
    namespace :v1 do
      resources :babies, only: [ :index, :create, :update ]
      resources :log_entries, only: [ :index, :create ]
    end
  end


  root to: "application#index"
end
