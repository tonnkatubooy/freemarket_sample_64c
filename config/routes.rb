Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index,:new,:create,:show,:destroy] do
    member do
      get 'purchase'
     end
  end 
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update]
  end
  resources :cards, only: [:index, :new]
end
