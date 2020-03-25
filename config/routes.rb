Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
 create_exhibitpage
  resources :items, only: [:index, :show, :new]
  resources :items, only: [:index, :show]
  resources :users, only: [:show]
  master
end
