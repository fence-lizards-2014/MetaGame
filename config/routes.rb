Metagame::Application.routes.draw do

  resources :users do
             resources :messages do
               collection do
                 post :delete_selected
               end
             end
           end

  root to: 'users#index'
  resources :games
  resources :groups
  resources :posts

  resources :events do
    resources :tournaments, only: [:new, :create]
  end


  get '/logout', to: 'sessions#logout', as: :logout
  post "auth/steam/callback" => 'sessions#auth_callback', as: "steam_auth"
  get '/signin', to: 'sessions#signin', as: :signin
  post '/sessions', to: "sessions#sign_in_attempt", as: :sign_in_attempt
  get '/newpassword', to: "users#new_password", as: :new_password
  put "/changepw", to: "users#update_password", as: :change_pw
  post '/addgame/:id', to: 'users#addgame', as: :addgame
  post '/adduser/:id', to: 'groups#add_user', as: :add_user
  post '/removeuser/:id', to: 'groups#remove_user', as: :remove_user
  post '/adduserevent/:id', to: 'events#add_user_event', as: :add_user_event
  post "/searchgames", to: "games#search", as: :search_games
  post "/searchevents", to: "events#search", as: :search_events
  post '/start_tourney', to: "tournaments#start", as: :start_tournament
  get '/mygroups', to: "groups#my_groups", as: :my_groups
end
