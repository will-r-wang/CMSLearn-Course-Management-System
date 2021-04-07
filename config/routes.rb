Rails.application.routes.draw do

  resources :course_registrations, only: [:show] do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :user_registrations, only: [:show] do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :courses
  resources :users
  resources :teachers, controller: 'users', type: 'Teacher'
  resources :admins, controller: 'users', type: 'Admin'
  resources :students, controller: 'users', type: 'Student'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'pages/home'

  root to: 'pages#home'
end
