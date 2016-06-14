Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :senators, only: [:show]

  resources :game_play, only: [:index, :game_over]

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  resources :games, only: [:create, :show]

  # get 'games/game_over/:id', to: 'games#game_over', as: 'game_over'

end
