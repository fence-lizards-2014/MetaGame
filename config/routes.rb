Metagame::Application.routes.draw do

  root to: 'users#index'
  resources :users
  resources :games
  resources :groups
  resources :events

  get '/logout', to: 'sessions#logout', as: :logout
  post "auth/steam/callback" => 'sessions#auth_callback', as: "steam_auth"
  get '/signin', to: 'sessions#signin', as: :signin
  post '/sessions', to: "sessions#sign_in_attempt", as: :sign_in_attempt

end
