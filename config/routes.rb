Metagame::Application.routes.draw do

  root to: 'users#index'
  resources :users
  resources :games
  resources :groups
  resources :events

  post '/addgame/:id', to: 'users#addgame', as: :addgame
  post '/adduser/:id', to: 'groups#add_user', as: :add_user

  get '/logout', to: 'sessions#logout', as: :logout
  post "auth/steam/callback" => 'sessions#auth_callback', as: "steam_auth"
  get '/signin', to: 'sessions#signin', as: :signin
  post '/sessions', to: "sessions#sign_in_attempt", as: :sign_in_attempt
  get '/newpassword', to: "users#new_password", as: :new_password
  put "/changepw", to: "users#update_password", as: :change_pw
  post "/searchgames", to: "games#search", as: :search_games
end
