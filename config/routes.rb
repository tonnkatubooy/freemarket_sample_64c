Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index,:new,:create,:show] do
    member do
      get 'purchase'
     end
  end 
  resources :users, only: [:show]
end
