Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords:  'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :admins, only: [:edit,:update,:show]
  resources :users, only: [:edit,:update,:show]
  get 'messages/index'
  root to: "rooms#index"
  resources :rooms,only: [:new,:create,:destroy] do
  resources :messages,only: [:new,:create,:index]
  end
end
