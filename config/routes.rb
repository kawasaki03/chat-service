Rails.application.routes.draw do
  devise_for :teachers, controllers: {
    sessions: "teachers/sessions",
    passwords:  'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  devise_for :students, controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }
  resources :teachers, only: [:edit,:update,:show]
  resources :students, only: [:edit,:update,:show]
  get 'messages/index'
  # root to: "rooms#index"
  resources :rooms,only: [:index,:new,:create,:destroy] do
  resources :messages,only: [:new,:create,:index]
  end
  get 'contacts/index'
  resources :teacher_rooms,only: [:index,:new,:create,:destroy] do
    resources :contacts,only: [:new,:create,:index]
  end
end
