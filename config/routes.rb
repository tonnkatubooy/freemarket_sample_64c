Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
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

  resources :cards, only: [:index,:new,:show] do
    collection do
      post 'new', to: 'cards#new'
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'buy', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
