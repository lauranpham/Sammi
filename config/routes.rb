Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :subjects do
    resources :class_memberships, only: [:create]
  end

  resources :appointments, only: [:show, :index, :destroy, :edit, :update]

  resources :users, only: [:show] do
    resources :appointments, only: [:create]
  end

  resources :class_memberships, only: [:destroy]
  resources :daily_emotions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
