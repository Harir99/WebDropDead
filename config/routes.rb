Rails.application.routes.draw do
  get 'games/play'
  get 'games/run'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'welcome#index'
  get 'sign_in', to: 'sessions#new'
  get 'play', to: 'games#play'
  post 'run_game', to: 'games#run_game'
  get 'run_game', to: 'games#run_game' 
  get 'results', to: 'games#results'
  get 'play_again', to: 'games#play_again'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :games do
    post 'run_game', on: :collection
    get 'results', on: :collection
  #  do
    
  end


end
