Rails.application.routes.draw do
  devise_for :users
  root to: 'users#profile'
  get 'profile', to: 'users#profile'
  resources :users, only: [:show]

  namespace :api do
    post '/barbecues/:id/join', to: 'barbecues#join'
    post '/barbecues/:id/addItem/:input', to: 'barbecues#addItem'
    resources :barbecues, only: [:show]
  end

  resources :barbecues, only: [ :index, :show, :new, :create ]
end