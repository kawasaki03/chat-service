Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit,:update]
  get 'messages/index'
  root to: "rooms#index"
  resources :rooms,only: [:new,:create]
end
