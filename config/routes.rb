Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :subjects do
    resources :class_memberships, only: [:create, :destroy, :index]
  end

  resources :appoinments, only: [:show, :index, :destroy, :edit, :update]

  resources :users, only: [:show] do
    resources :appointments, only: [:create]
  end

  resources :daily_emotions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
