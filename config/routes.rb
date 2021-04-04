Rails.application.routes.draw do
  resources :user_registrations, only: [:show] do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'pages/home'

  root to: 'pages#home'
end
