Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Application Controller routes
  get "/", to: "application#index", as: "index"

  # User Routes
  get "/users", to: "users#index", as: "users"




  # Song Routes
  get "/songs", to: "songs#index", as: "songs"




  get "/songs/:id", to: "songs#show", as: "song"

end
