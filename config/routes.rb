Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users, only: [:edit,:update]
  get 'messages/index'
  root to: "rooms#index"
  resources :rooms,only: [:new,:create,:destroy] do
  resources :messages,only: [:new,:create,:index]
  end
end
