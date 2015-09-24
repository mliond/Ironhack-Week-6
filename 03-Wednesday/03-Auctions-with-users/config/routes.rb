Rails.application.routes.draw do

  post '/sessions', to: 'sessions#new'

  get '/', to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources 'products', only: [:index, :destroy, :show] do
    resources 'bids', only: [:new, :create]
  end

  resources 'users', only: [:index, :show, :new, :create] do  
    resources 'products', only: [:new, :create] 
  end
end
