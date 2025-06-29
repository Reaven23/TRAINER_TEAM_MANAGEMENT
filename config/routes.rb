Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  # Teams routes
  resources :teams do
    member do
      get :players
      get :coaches
      get :parents
    end

    # Nested routes for team players
    resources :players, only: [:new, :create, :destroy], controller: 'team_players'
  end

  # Skills routes
  resources :skills

  # User Skills routes (nested under users)
  resources :users, only: [] do
    resources :user_skills, only: [:index, :create, :update, :destroy]
  end

  # Profiles routes (for viewing and editing user profiles)
  resources :profiles, only: [:show, :edit, :update]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"
end
