Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :requests, only: [:new, :create]
  resources :feedbacks, only: [:new, :create]

  get 'thank_you', to: 'pages#thank_you'

  root to: 'requests#new'
end
