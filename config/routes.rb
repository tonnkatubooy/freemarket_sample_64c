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

  resources :card, only: [:index,:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
