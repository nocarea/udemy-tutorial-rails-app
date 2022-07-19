Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'profiles', to: 'profiles#index'
  resource :profile, only: [:show]
  resources :articles
end
