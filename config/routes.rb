Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :senators, only: [:show]

  resources :game_play, only: [:index]

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  get 'games/game_over', to: 'games#game_over', as: 'game_over'

  resources :games, only: [:create, :show]


end
