Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  resources :test_passages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
  end
  post 'start', on: :member
end
  root 'tests#index'

  resources :test_passages, only: %i[show update] do
    get 'result', on: :member
  end

  resources :users, only: :create
  get :signup, to: 'users#new'

  resources :sessions, only: :create
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
end
