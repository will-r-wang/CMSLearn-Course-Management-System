Rails.application.routes.draw do

  resources :announcements, except: [:index, :show]

  resources :deliverables, except: [:index]
  resources :assignments, controller: 'deliverables', type: 'Assignment'
  resources :quizzes, controller: 'deliverables', type: 'Quiz'
  resources :tutorials, controller: 'deliverables', type: 'Tutorial'

  resources :resources, except: [:index]
  resources :urls, controller: 'resources', type: 'Url'
  resources :videos, controller: 'resources', type: 'Video'
  resources :documents, controller: 'resources', type: 'Document'

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
    post 'create_announcement', on: :member
    post 'update_grade', on: :member
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
