Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :show, :new]
  resources :items, only: [:index, :show]
  resources :items, only: [:index, :show] do
    member do
      get 'purchase'
     end
  end 
  resources :users, only: [:show]
  master
end
