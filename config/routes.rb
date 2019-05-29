Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Application Controller routes
  get "/", to: "application#index", as: "index"

  # User Routes
  
  resources :users
  patch '/users/:id/follow', to: 'users#follow', as: 'follow'
  
  
  
  # Playlist Routes
 
  resources :playlists



  # Song Routes
  get "/songs", to: "songs#index", as: "songs"




  get "/songs/:id", to: "songs#show", as: "song"

  # PlaylistSongs Routes

  post "/playlistsongs/:id", to: "playlistsongs#create", as: "add_song"
  delete "playlistsongs/:id", to: "playlistsongs#delete"


  # Sessions Routes

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
end
