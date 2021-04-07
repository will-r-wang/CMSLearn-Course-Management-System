Rails.application.routes.draw do

  resources :course_registrations do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :user_registrations do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :courses do
    post 'register', on: :member
    post 'withdraw', on: :member
  end

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
