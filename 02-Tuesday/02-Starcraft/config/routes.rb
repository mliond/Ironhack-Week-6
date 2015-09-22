Rails.application.routes.draw do

  namespace :api do
    resources :players
    get 'matches/:faction' => 'matches#faction_show'
  end

end
