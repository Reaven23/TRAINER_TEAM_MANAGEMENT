Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # Teams routes
  resources :teams do
    member do
      get :players
      get :coaches
      get :parents
    end
  end

  # Skills routes
  resources :skills

  # User Skills routes
  resources :user_skills

  # Users routes (for coaches to manage players)
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :skills_report
      get :pdf_report
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
