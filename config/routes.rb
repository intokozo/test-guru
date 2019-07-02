Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users,
    path: :gurus,
    path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: :sessions, registrations: :registrations }

  resources :tests, only: :index do
    post 'start', on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      get :finish
      post :gist
    end
  end

  resources :badges, only: :index

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
      patch :update_inline, on: :member
    end
    resources :gists, only: %i[index]
    resources :badges
    get '/rule_values', to: 'rules#values'
  end

  resources :feedbacks, only: %i[new create]
end
